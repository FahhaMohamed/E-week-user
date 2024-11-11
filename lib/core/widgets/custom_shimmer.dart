import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double? radius;
  double? opacity;

  CustomShimmer({
    required this.height,
    required this.width,
    this.radius,
    this.opacity = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 245, 245, 245).withOpacity(opacity!),
      highlightColor:
          Colors.white.withOpacity(opacity! != 1 ? (opacity! + .3) : opacity!),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radius != null
              ? BorderRadius.all(Radius.circular(radius!))
              : BorderRadius.zero,
        ),
      ),
    );
  }
}