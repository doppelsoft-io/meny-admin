import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/presentation/menus/menu_preview/widgets/widgets.dart';
import 'package:meny/src/presentation/shared/shared.dart';

class CompiledMenuBuilder extends StatelessWidget {
  final MenuModel menu;

  const CompiledMenuBuilder({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompiledMenuCubit>(
      create: (context) => CompiledMenuCubit()..load(menu: menu),
      child: BlocBuilder<CompiledMenuCubit, CompiledMenuState>(
        builder: (context, state) {
          switch (state.status) {
            case CompiledMenuStatus.initial:
            case CompiledMenuStatus.loading:
              return const LoadingDisplay(adaptive: true);
            case CompiledMenuStatus.error:
              return ErrorDisplay(failure: state.failure!);
            case CompiledMenuStatus.success:
              return CompiledCategoryBuilder(
                menuId: state.menu!.id!,
              );
          }
        },
      ),
    );
  }
}
