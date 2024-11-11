import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.w,
    required this.title,
    required this.onTap,
  });

  final double w;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        width: w,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor,
                  offset: Offset(0, 3),
                  blurRadius: 3)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            subHeadingText(text: '$title of the E-Week'),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
