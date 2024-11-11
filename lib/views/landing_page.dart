import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/widgets/logo.dart';
import 'package:user/core/widgets/logo_loading_widget.dart';
import 'package:user/navigation/bottom_nav.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _showLoadingWidget = false;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _showLoadingWidget = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const BottomNav()));
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
                  AppColors.eventContainerColor,
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
