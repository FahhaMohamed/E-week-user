import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:user/core/contants/global.dart';

class OnBoardAnimation extends StatelessWidget {
  const OnBoardAnimation({
    super.key,
    required bool showLottie,
    required this.w,
  }) : _showLottie = showLottie;

  final bool _showLottie;
  final double w;

  @override
  Widget build(BuildContext context) {
   

    return AnimatedOpacity(
      opacity: _showLottie ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Lottie.asset(
        AppImagePaths.onBoardingLottie,
        repeat: false,
        width: w,
      ),
    );
  }
}
