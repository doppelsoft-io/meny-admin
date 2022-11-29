import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/domain/core/action_object.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class NewMenuButton extends StatelessWidget {
  const NewMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocProvider.value(
    //   value: context.read<CreateMenuCubit>(),
    //   child: const _NewMenuButton(),
    // );
    return const _NewMenuButton();
  }
}

class _NewMenuButton extends HookWidget {
  const _NewMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageActionButton(
      title: 'New',
      onPressed: ActionObject(
        eventName: Analytics.menusTabNewTapped,
        callback: () {
          Locator.instance<NavigatorHelper>()
              .goNamed(CreateMenuScreen.routeName);
        },
      ),
    );
  }
}
