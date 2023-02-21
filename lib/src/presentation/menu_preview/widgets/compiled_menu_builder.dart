import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class CompiledMenuBuilder extends StatelessWidget {
  const CompiledMenuBuilder({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final CompiledMenuModel menu;

  @override
  Widget build(BuildContext context) {
    return _CompiledMenuBuilder(menu: menu);
  }
}

class _CompiledMenuBuilder extends StatelessWidget {
  const _CompiledMenuBuilder({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final CompiledMenuModel menu;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompiledMenuCubit, CompiledMenuState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (_, exception) {
            DialogService.showErrorDialog(
              context: context,
              failure: CustomException(
                message: exception.toString(),
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (_) => const LinearProgressIndicator(),
          orElse: () {
            final categories =
                List<CompiledCategoryModel>.from(state.response.categories);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: DSSpacing.lg),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DSSpacing.md,
                  ),
                  child: DSButton(
                    theme: const DSButtonThemeData.outlined(),
                    text: 'Organize',
                    icon: DSIcon(
                      iconData: FontAwesomeIcons.barsStaggered,
                      theme: DSIconThemeData.fallback().copyWith(
                        color: whiteColor,
                        size: 18,
                      ),
                      semanticLabel: 'Organize',
                    ),
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (_, __, ___) => BlocProvider.value(
                          value: context.read<CompiledMenuCubit>(),
                          child: MenuPreviewCategoryReorderDialog(
                            menuId: menu.id,
                            categories: categories,
                          ),
                        ),
                      ).then((value) {
                        context.read<CompiledMenuCubit>().load(id: menu.id);
                      });
                    },
                  ),
                ),
                const SizedBox(height: DSSpacing.lg),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: DSSpacing.md,
                  ),
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, categoryIndex) {
                    final category = categories[categoryIndex];
                    final items = List<CompiledMenuItemModel>.from(
                      category.items,
                    );
                    return Container(
                      key: Key(category.id),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MenuPreviewCategoryToolbar(
                            category: category,
                            onReorderTapped: () {},
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                              vertical: DSSpacing.xs,
                            ),
                            itemCount: items.length,
                            itemBuilder: (context, itemIndex) {
                              final item = items[itemIndex];
                              return Container(
                                key: Key(item.id),
                                padding: const EdgeInsets.symmetric(
                                  vertical: DSSpacing.xs,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DSText(
                                            item.name,
                                            theme: const DSTextThemeData.b1(),
                                          ),
                                          if (item.description != null &&
                                              item.description!.isNotEmpty) ...[
                                            const SizedBox(height: 2),
                                            DSText(
                                              item.description!,
                                              theme: const DSTextThemeData.b5(),
                                            ),
                                          ],
                                          const SizedBox(height: 6),
                                          DSText(
                                            (item.priceInfo.price / 100)
                                                .toCurrency(),
                                            theme: const DSTextThemeData.b5(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: DSSpacing.sm),
                                    if (item.imageUrl != null &&
                                        item.imageUrl!.isNotEmpty)
                                      MenuItemImage(
                                        imageUrl: item.imageUrl ?? '',
                                        theme:
                                            DSNetworkImageThemeData.fallback()
                                                .copyWith(
                                          width: 91,
                                          height: 73,
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
