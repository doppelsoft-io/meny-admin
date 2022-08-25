import 'dart:typed_data';

import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';

class MenuItemImage extends StatelessWidget {
  const MenuItemImage({
    Key? key,
    required this.imageUrl,
    this.theme,
  }) : super(key: key);

  final String imageUrl;
  final DSMemoryImageThemeData? theme;

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? DSMemoryImageThemeData.thumbnail();

    return BlocProvider(
      create: (context) => ImageDisplayCubit()..seed(imageUrl),
      child: _MenuItemImage(
        imageUrl: imageUrl,
        theme: theme,
      ),
    );
  }
}

class _MenuItemImage extends HookWidget {
  const _MenuItemImage({
    Key? key,
    required this.imageUrl,
    required this.theme,
  }) : super(key: key);

  final String imageUrl;
  final DSMemoryImageThemeData theme;

  @override
  Widget build(BuildContext context) {
    final imageDisplayState = context.watch<ImageDisplayCubit>().state;

    useEffect(
      () {
        context.read<ImageDisplayCubit>().seed(imageUrl);
        return null;
      },
      [imageUrl],
    );

    return DSMemoryImage(
      theme: theme,
      args: DSMemoryImageArgs(
        url: imageUrl,
        bytes: imageDisplayState.maybeWhen(
          loaded: (url, bytes) => bytes,
          orElse: () => Uint8List.fromList([]),
        ),
        processing: imageDisplayState.maybeWhen(
          loading: (_, __) => true,
          orElse: () => false,
        ),
      ),
    );
  }
}
