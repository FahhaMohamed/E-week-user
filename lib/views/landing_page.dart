import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/widgets/logo.dart';
import 'package:user/core/widgets/logo_loading_widget.dart';
import 'package:user/navigation/bottom_nav.dart';
import 'package:user/views/on_boarding_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _showLoadingWidget = false;
  bool isOpened = false;

  checkRule() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isOpened = sharedPreferences.getBool('isOpened') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    checkRule();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _showLoadingWidget = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) =>
                isOpened ? const BottomNav() : const OnBoardingPage()));
      });
    });

    final double logoSize = MediaQuery.of(context).size.width * 0.3;

    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: logoSize),
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 216, 240, 255),
                  AppColors.backgroundColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: _showLoadingWidget
                ? LogoLoadingWidget(width: logoSize)
                : ourLogo(size: logoSize)),
      ),
    );
  }
}
