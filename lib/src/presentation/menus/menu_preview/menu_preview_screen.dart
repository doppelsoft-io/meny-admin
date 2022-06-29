import 'dart:developer';

import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny_admin/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/menus/menus.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';
import 'package:qr_flutter/qr_flutter.dart';

class _MenuPreviewHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _MenuPreviewHeaderDelegate({
    required this.title,
    required this.onPublish,
  });

  final String title;
  final Function() onPublish;

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
                  onPressed: onPublish,
                  child: const Text('Publish'),
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
      true;
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
                published: (_) {
                  //
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
                    onPublish: () {
                      log('JSON ${state.response.toJson()}');
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
