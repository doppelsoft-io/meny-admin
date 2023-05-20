import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/dialog_service.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({Key? key}) : super(key: key);

  static const String routeName = 'create-category';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateCategoryCubit(
        storeCubit: context.read<StoreCubit>(),
      ),
      child: const _CreateCategoryScreen(),
    );
  }
}

class _CreateCategoryScreen extends HookWidget {
  const _CreateCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        Future.delayed(const Duration(milliseconds: 300), () {
          context.read<CreateCategoryCubit>().create();
        });
        return null;
      },
      const [],
    );
    return BlocConsumer<CreateCategoryCubit, CreateCategoryState>(
      listener: (context, state) {
        state.maybeWhen(
          creating: (_) {
            DSLoadingIndicator.dialog(context);
          },
          error: (_, exception) {
            Locator.instance<NavigatorHelper>().goToCategories();
            DialogService.showErrorDialog(
              context: context,
              failure: CustomException(message: exception.toString()),
            );
          },
          created: (_) {
            Locator.instance<NavigatorHelper>().goNamed(
              EditCategoryScreen.routeName,
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
