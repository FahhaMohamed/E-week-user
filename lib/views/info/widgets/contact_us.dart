import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/open_whats_app.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        openWhatsApp();
      },
      child: Container(
          width: w,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.symmetric(vertical: 30),
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadowColor,
                    offset: Offset(0, 5),
                    blurRadius: 5)
              ],
              color: AppColors.iconColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Text(
            "Contact Us",
            style: TextStyle(color: AppColors.backgroundColor, fontSize: 17),
          )),
    );
  }
}
