import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/dialog_service.dart';

class CreateMenuScreen extends StatelessWidget {
  const CreateMenuScreen({Key? key}) : super(key: key);

  static const String routeName = 'create-menu';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateMenuCubit(
        storeCubit: context.read<StoreCubit>(),
      ),
      child: const _CreateMenuScreen(),
    );
  }
}

class _CreateMenuScreen extends HookWidget {
  const _CreateMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        Future.delayed(const Duration(milliseconds: 300), () {
          context.read<CreateMenuCubit>().create();
        });
        return null;
      },
      const [],
    );
    return BlocConsumer<CreateMenuCubit, CreateMenuState>(
      listener: (context, state) {
        state.maybeWhen(
          creating: (_) {
            DSLoadingIndicator.dialog(context);
          },
          error: (_, exception) {
            Navigator.of(context).pop();
            DialogService.showErrorDialog(
              context: context,
              failure: CustomException(message: exception.toString()),
            );
          },
          created: (menu) {
            Navigator.of(context).pop();
            GoRouter.of(context).goNamed(
              EditMenuScreen.routeName,
              params: {'id': menu.id!},
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          creating: (_) => const DSLoadingIndicator(),
          orElse: SizedBox.shrink,
        );
      },
    );
  }
}
