import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/themes.dart';

class TextFieldConfiguration {
  const TextFieldConfiguration({
    this.decoration = const InputDecoration(),
  });

  final InputDecoration decoration;
}

class SuggestionConfiguration {
  const SuggestionConfiguration({
    required this.title,
  });

  final String title;
}

class TagConfiguration {
  const TagConfiguration({
    required this.title,
    required this.removable,
    this.color,
  });

  final String title;
  final bool removable;
  final Color? color;
}

class TagSelector<T> extends HookWidget {
  const TagSelector({
    Key? key,
    required this.context,
    required this.initialItems,
    required this.fetchSuggestions,
    required this.suggestionConfigurationBuilder,
    required this.tagConfigurationBuilder,
    required this.onSelect,
    required this.onRemove,
    required this.emptyBuilder,
    this.textFieldConfiguration = const TextFieldConfiguration(),
    this.tagBuilder,
    this.title,
  }) : super(key: key);

  final BuildContext context;
  final List<T> initialItems;
  final Future<List<T>> Function() fetchSuggestions;
  final Function(BuildContext, T) onSelect;
  final Function(BuildContext, T) onRemove;
  final Widget Function(BuildContext) emptyBuilder;
  final Widget Function(BuildContext, TagConfiguration, T)? tagBuilder;
  final SuggestionConfiguration Function(BuildContext, T)
      suggestionConfigurationBuilder;
  final TagConfiguration Function(BuildContext, T) tagConfigurationBuilder;
  final TextFieldConfiguration textFieldConfiguration;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    useEffect(
      () {
        focusNode.addListener(() {
          if (!focusNode.hasFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        });
        return null;
      },
      const [],
    );

    return GestureDetector(
      /// Needed so that `onTap` works properly
      behavior: kIsWeb ? null : HitTestBehavior.translucent,

      /// So the drawer closes when you click outside the dropdown
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DSTextFormField(
            theme: Themes.theme.textFormFieldThemeData,
            args: DSTextFormFieldArgs(
              controller: TextEditingController(),
              focusNode: focusNode,
              decoration: textFieldConfiguration.decoration,
              onTap: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (_, anim, anim2) {
                    return DSModal(
                      title: DSText.subtitle1(title ?? 'Select'),
                      child: FutureBuilder<List<T>>(
                        future: fetchSuggestions(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final data = (snapshot.data!)
                                .where((e) => !initialItems.contains(e))
                                .toList();

                            return ListView.separated(
                              separatorBuilder: (context, i) {
                                return const Divider(height: 0);
                              },
                              shrinkWrap: true,
                              itemCount: data.isEmpty ? 1 : data.length,
                              itemBuilder: (context, i) {
                                if (data.isEmpty) {
                                  return emptyBuilder(context);
                                } else {
                                  final item = data[i];
                                  final config = suggestionConfigurationBuilder(
                                    context,
                                    item,
                                  );

                                  return ListTile(
                                    visualDensity: VisualDensity.standard,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: DSSpacing.medium,
                                    ),
                                    onTap: () {
                                      onSelect(context, item);
                                      Navigator.of(context).pop();
                                    },
                                    title: DSText.subtitle1(
                                      config.title,
                                      styleOverrides: Theme.of(context)
                                          .textTheme
                                          .bodyText1!,
                                    ),
                                  );
                                }
                              },
                            );
                          } else {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(18),
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Visibility(
            visible: false,
            child: LinearProgressIndicator(),
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: initialItems.map(
                  (T option) {
                    final tagConfiguration =
                        tagConfigurationBuilder(context, option);

                    if (tagBuilder != null) {
                      return tagBuilder!(context, tagConfiguration, option);
                    } else {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: tagConfiguration.color ??
                              Theme.of(context).primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              tagConfiguration.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                onRemove(context, option);
                              },
                              child: Icon(
                                Icons.close,
                                size: 20,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
