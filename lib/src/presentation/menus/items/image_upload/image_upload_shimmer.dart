import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageUploadShimmer extends StatelessWidget {
  const ImageUploadShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade100,
      child: Container(color: Colors.white),
    );
  }
}
