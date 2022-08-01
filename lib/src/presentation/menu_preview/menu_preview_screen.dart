import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';
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
  double get maxExtent => 130;

  @override
  double get minExtent => 130;

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
      child: Container(
        padding: const EdgeInsets.all(DSSpacing.medium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
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
                DSText.headline3(
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

class MenuPreviewScreen extends StatelessWidget {
  const MenuPreviewScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  static const String routeName = 'menu-preview';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompiledMenuCubit(
        storeCubit: context.read<StoreCubit>(),
      )..load(id: id),
      child: _MenuPreviewScreen(id: id),
    );
  }
}

class _MenuPreviewScreen extends StatelessWidget {
  const _MenuPreviewScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

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
                    title: state.response.name,
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
