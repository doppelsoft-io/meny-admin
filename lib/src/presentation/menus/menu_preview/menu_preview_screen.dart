import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/presentation/menus/menu_preview/widgets/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class _MenuPreviewHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _MenuPreviewHeaderDelegate({required this.title});

  final String title;

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
            Text(
              title,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.black,
                  ),
            ),
            Row(
              children: [
                QrImage(
                  data: 'https://google.com',
                  size: 75,
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  child: const Text('Publish'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
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
      builder: (context) => BlocProvider<ViewMenuCubit>(
        create: (context) => ViewMenuCubit()..compile(menuId: args.menu.id!),
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
    return BlocBuilder<ViewMenuCubit, ViewMenuState>(
      builder: (context, state) {
        if (state.menu != null) {
          final menu = state.menu!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Menu Preview'),
            ),
            body: BlocProvider<CompiledMenuCubit>(
              // create: (context) => CompiledMenuCubit()..load(menu: menu),
              create: (context) => CompiledMenuCubit(
                storeCubit: context.read<StoreCubit>(),
              )..load(menu: menu),
              child: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _MenuPreviewHeaderDelegate(
                      title: widget.args.menu.name,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CompiledMenuBuilder(menu: menu),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Menu Preview'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
