import 'package:flutter/material.dart';

class LoadingDisplay extends StatelessWidget {
  final Alignment alignment;
  final bool adaptive;

  const LoadingDisplay({
    Key? key,
    this.alignment = Alignment.topCenter,
    this.adaptive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: adaptive
          ? const CircularProgressIndicator.adaptive()
          : const CircularProgressIndicator(),
    );
  }
}
