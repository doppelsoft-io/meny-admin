import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meny/src/presentation/menus/items/image_upload/image_upload_shimmer.dart';

const kImageUploadCardWidth = 275.0;
const kImageUploadCardHeight = 220.0;

class ImageDisplayCard extends StatelessWidget {
  const ImageDisplayCard({
    Key? key,
    required this.url,
    required this.emptyBuilder,
    this.width = kImageUploadCardWidth,
    this.height = kImageUploadCardHeight,
    this.onTap,
    this.processing = false,
  }) : super(key: key);

  factory ImageDisplayCard.forTableDisplay({
    required String url,
    bool? processing,
    Function()? onTap,
  }) {
    return ImageDisplayCard(
      url: url,
      width: kImageUploadCardWidth * .30,
      height: kImageUploadCardHeight * .30,
      processing: processing ?? false,
      onTap: onTap,
      emptyBuilder: () => const Center(child: Icon(Icons.image)),
    );
  }

  factory ImageDisplayCard.forMenuDisplay({
    required String url,
    bool? processing,
    Function()? onTap,
  }) {
    return ImageDisplayCard(
      url: url,
      width: kImageUploadCardWidth / 3,
      height: kImageUploadCardHeight / 3,
      processing: processing ?? false,
      onTap: onTap,
      emptyBuilder: () => const SizedBox.shrink(),
    );
  }

  final String url;
  final double width;
  final double height;
  final bool processing;
  final Function()? onTap;
  final Widget Function() emptyBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(width: 2, color: Colors.grey[200]!),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          // alignment: Alignment.center,
          children: [
            _LoadingContainer.custom(
              child: const SizedBox.shrink(),
            ),
            if (url.isNotEmpty) ...[
              if (kIsWeb)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    url,
                    width: width,
                    height: height,
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
                )
              else
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: url,
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => const ImageUploadShimmer(),
                  ),
                )
            ] else ...[
              emptyBuilder(),
            ],
            if (processing) _LoadingContainer.custom(color: Colors.white38),
          ],
        ),
      ),
    );
  }
}

class _LoadingContainer extends StatelessWidget {
  const _LoadingContainer({
    Key? key,
    required this.child,
    this.width = kImageUploadCardWidth,
    this.height = kImageUploadCardHeight,
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
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(11),
      ),
      child: child,
    );
  }
}
