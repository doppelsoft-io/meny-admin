import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';

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
        menuId: id,
      ),
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
          body: BlocListener<CompiledMenuCubit, CompiledMenuState>(
            listener: (context, state) {
              state.maybeWhen(
                publishing: (_) {},
                published: (menu) {
                  Locator.instance<ToastService>().init(
                    const DSToast.notification(
                      text: 'Your menu has been published',
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
                  delegate: MenuPreviewHeaderDelegate(
                    title: state.response.name,
                    publishing: state.maybeWhen(
                      publishing: (_) => true,
                      orElse: () => false,
                    ),
                    onPublish: () =>
                        context.read<CompiledMenuCubit>().publish(),
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
