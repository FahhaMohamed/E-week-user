import 'package:flutter/material.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/views/onBoarding/widgets/on_board_animation.dart';
import 'package:user/views/onBoarding/widgets/start_button.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  bool _showLottie = false;

  String onBoardingWelcomeText = "₊˚✧ Welcome to ✧˚₊";
  String onBoardingTitleText = "✧˚ E-Week 2K24 ˚✧";

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _showLottie = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                subHeadingText(text: onBoardingWelcomeText),
                dayText(day: onBoardingTitleText, isSelect: false),
                SizedBox(height: w * .07),
                OnBoardAnimation(showLottie: _showLottie, w: w),
                SizedBox(height: w * .2),
                StartButton(w: w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
