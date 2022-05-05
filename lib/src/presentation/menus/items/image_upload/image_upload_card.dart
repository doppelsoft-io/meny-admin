import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/data/menu_items/src/cubits/cubits.dart';
import 'package:meny/src/data/menu_items/src/models/models.dart';

class ImageUploadCard extends StatelessWidget {
  const ImageUploadCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MenuItemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ImageUploadCubit>().pick(),
      child: BlocConsumer<ImageUploadCubit, ImageUploadState>(
        listener: (context, state) {
          state.maybeWhen(
            picked: (file, url) =>
                context.read<ImageUploadCubit>().upload(item: item),
            orElse: () {},
          );
        },
        builder: (context, state) {
          print('MEE: HERE STATEURL ${state.url}');
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  _LoadingContainer.custom(
                    child: const SizedBox.shrink(),
                  ),
                  if (state.url.isNotEmpty) ...[
                    Image.network(
                      state.url,
                      width: 275,
                      height: 220,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress?.cumulativeBytesLoaded ==
                            progress?.expectedTotalBytes) {
                          return child;
                        }
                        return Stack(
                          children: [
                            _LoadingContainer.custom(
                              color: Colors.white38,
                            ),
                          ],
                        );
                      },
                    ),
                  ] else ...[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.image),
                        Text('Click to upload')
                      ],
                    )
                  ],
                  state.maybeWhen(
                    uploading: (_, __) => _LoadingContainer.custom(
                      color: Colors.white38,
                    ),
                    orElse: () => const SizedBox.shrink(),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Photos of your menu items can help customers when deciding to order and can increase sales.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _LoadingContainer extends StatelessWidget {
  const _LoadingContainer({
    Key? key,
    required this.child,
    this.width = 275,
    this.height = 220,
    this.color,
  }) : super(key: key);

  factory _LoadingContainer.custom({
    Widget? child,
    Color? color,
  }) {
    return _LoadingContainer(
      color: color,
      child: child ??
          const SizedBox(
            height: 30,
            width: 30,
            child: Center(child: CircularProgressIndicator()),
          ),
    );
  }

  final Widget child;
  final Color? color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.grey[200],
      width: width,
      height: height,
      child: child,
    );
  }
}
