import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextFieldConfiguration {
  final InputDecoration? decoration;

  const TextFieldConfiguration({
    this.decoration = const InputDecoration(),
  });
}

class SuggestionConfiguration {
  final String title;

  const SuggestionConfiguration({
    required this.title,
  });
}

class TagConfiguration {
  final String title;
  final bool removable;
  final Color? color;

  const TagConfiguration({
    required this.title,
    required this.removable,
    this.color,
  });
}

class TagSelector<T> extends HookWidget {
  final List<T> initialItems;
  final Future<List<T>> Function() fetchSuggestions;
  final Function(BuildContext, T) onSelect;
  final Function(BuildContext, T) onRemove;
  final Widget Function(BuildContext) emptyBuilder;
  final SuggestionConfiguration Function(BuildContext, T)
      suggestionConfigurationBuilder;
  final TagConfiguration Function(BuildContext, T) tagConfigurationBuilder;
  final TextFieldConfiguration? textFieldConfiguration;

  const TagSelector({
    Key? key,
    required this.initialItems,
    required this.fetchSuggestions,
    required this.suggestionConfigurationBuilder,
    required this.tagConfigurationBuilder,
    required this.onSelect,
    required this.onRemove,
    required this.emptyBuilder,
    this.textFieldConfiguration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isOpen = useState<bool>(false);

    return GestureDetector(
      /// Needed so that `onTap` works properly
      behavior: HitTestBehavior.translucent,

      /// So the drawer closes when you click outside the dropdown
      onTap: () => isOpen.value = false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: textFieldConfiguration?.decoration,
            onTap: () => isOpen.value = !isOpen.value,
          ),
          const Visibility(
            visible: false,
            child: LinearProgressIndicator(),
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runSpacing: 10,
                spacing: 10,
                children: initialItems.map(
                  (T option) {
                    final tagConfiguration =
                        tagConfigurationBuilder(context, option);

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
                  },
                ).toList(),
              ),
              Visibility(
                visible: isOpen.value,
                child: Card(
                  elevation: 10,
                  child: FutureBuilder<List<T>>(
                    future: fetchSuggestions(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = (snapshot.data as List<T>)
                            .where((e) => !initialItems.contains(e))
                            .toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
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
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,),
                                onTap: () {
                                  onSelect(context, item);
                                  isOpen.value = false;
                                },
                                title: Text(
                                  config.title,
                                  style: Theme.of(context).textTheme.bodyText1,
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
                ),
              ),
              const SizedBox(height: 300),
            ],
          ),
        ],
      ),
    );
  }
}
