import 'package:flutter/material.dart';

class LoadingDisplay extends StatelessWidget {
  final bool adaptive;

  const LoadingDisplay({
    Key? key,
    this.adaptive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: adaptive
          ? const CircularProgressIndicator.adaptive()
          : const CircularProgressIndicator(),
    );
  }
}
