import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/dialog_service.dart';

class CreateMenuItemScreen extends StatelessWidget {
  const CreateMenuItemScreen({Key? key}) : super(key: key);

  static const String routeName = 'create-item';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateMenuItemCubit(
        storeCubit: context.read<StoreCubit>(),
      ),
      child: const _CreateMenuItemScreen(),
    );
  }
}

class _CreateMenuItemScreen extends HookWidget {
  const _CreateMenuItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        Future.delayed(const Duration(milliseconds: 300), () {
          context.read<CreateMenuItemCubit>().create();
        });
        return null;
      },
      const [],
    );
    return BlocConsumer<CreateMenuItemCubit, CreateMenuItemState>(
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
          created: (_) {
            Navigator.of(context).pop();
            GoRouter.of(context).goNamed(
              EditMenuItemScreen.routeName,
              params: {'id': _.id!},
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
