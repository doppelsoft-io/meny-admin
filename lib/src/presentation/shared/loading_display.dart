import 'package:flutter/material.dart';

class LoadingDisplay extends StatelessWidget {
  const LoadingDisplay({
    Key? key,
    this.alignment = Alignment.topCenter,
    this.adaptive = false,
  }) : super(key: key);

  final Alignment alignment;
  final bool adaptive;

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
