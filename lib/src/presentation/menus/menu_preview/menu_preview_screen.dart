import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/menus/menus.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';
import 'package:qr_flutter/qr_flutter.dart';

class _MenuPreviewHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _MenuPreviewHeaderDelegate({
    required this.title,
    required this.publishing,
    required this.onPublish,
  });

  final String title;
  final bool publishing;
  final Function() onPublish;

  @override
  double get maxExtent => 124;

  @override
  double get minExtent => 124;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate _) => true;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: maxExtent,
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.pageSpacing),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QrImage(
              data: 'https://google.com',
              size: 74,
              padding: EdgeInsets.zero,
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                DText.headline3(
                  title,
                  styleOverrides: const TextStyle(
                    color: Colors.black,
                    height: .9,
                  ),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.topCenter,
                    visualDensity: VisualDensity.compact,
                    // fixedSize: const Size(110, 48),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye),
                  label: const Text('View Online'),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: onPublish,
                    child: publishing
                        ? SizedBox(
                            height: 15,
                            width: 15,
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.green.shade50,
                              ),
                            ),
                          )
                        : const Text('Publish'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPreviewScreenArgs {
  const MenuPreviewScreenArgs({required this.menu});

  final MenuModel menu;
}

class MenuPreviewScreen extends StatefulWidget {
  const MenuPreviewScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  final MenuPreviewScreenArgs args;

  static const String routeName = '/menuPreviewScreen';

  static Route route(MenuPreviewScreenArgs args) {
    return MaterialPageRoute<Widget>(
      builder: (context) => BlocProvider<CompiledMenuCubit>(
        create: (context) => CompiledMenuCubit(
          storeCubit: context.read<StoreCubit>(),
        )..load(menu: args.menu),
        child: MenuPreviewScreen(args: args),
      ),
    );
  }

  @override
  State<MenuPreviewScreen> createState() => _MenuPreviewScreenState();
}

class _MenuPreviewScreenState extends State<MenuPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompiledMenuCubit, CompiledMenuState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Menu Preview'),
          ),
          body: BlocListener<CompiledMenuCubit, CompiledMenuState>(
            listener: (context, state) {
              state.maybeWhen(
                publishing: (_) {},
                published: (menu) {
                  Locator.instance<ToastService>().showOverlay(
                    const Text(
                      'Your menu has been published',
                    ),
                  );
                },
                error: (_, exception) {
                  DialogService.showErrorDialog(
                    context: context,
                    failure: CustomException(message: exception.toString()),
                  );
                },
                orElse: () {},
              );
            },
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _MenuPreviewHeaderDelegate(
                    title: widget.args.menu.name,
                    publishing: state.maybeWhen(
                      publishing: (_) => true,
                      orElse: () => false,
                    ),
                    onPublish: () {
                      context.read<CompiledMenuCubit>().publish();
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: CompiledMenuBuilder(menu: state.response),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
