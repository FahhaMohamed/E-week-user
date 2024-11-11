import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/navigation/bottom_nav.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  bool _showLottie = false;

  @override
  void initState() {
    super.initState();
    addRule();

    // Set the Lottie animation to appear with a delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _showLottie = true;
      });
    });
  }

  addRule() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isOpened', true);
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
                subHeadingText(text: "₊˚✧ Welcome to ✧˚₊"),
                dayText(day: "✧˚ E-Week 2K24 ˚✧", isSelect: false),
                SizedBox(height: w * .07),
                AnimatedOpacity(
                  opacity: _showLottie ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Lottie.asset(
                    "assets/lottie/on-boarding.json",
                    repeat: false,
                    width: w,
                  ),
                ),
                SizedBox(height: w * .2),
                ZoomTapAnimation(
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
                        subHeadingText(text: "Let's Start"),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
