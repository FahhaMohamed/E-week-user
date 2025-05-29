import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/navigation/bottom_nav.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {

    const String _buttonText = "Let's Start";

    return ZoomTapAnimation(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const BottomNav()),
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: w,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              offset: Offset(0, 3),
              blurRadius: 3,
            ),
          ],
          color: Color.fromARGB(255, 226, 226, 226),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            subHeadingText(text: _buttonText),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}