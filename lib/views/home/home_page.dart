import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/controllers/event_controller.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/core/widgets/logo.dart';
import 'package:user/models/event_status_model.dart';
import 'package:user/views/home/utils/date_calculator.dart';
import 'package:user/views/home/utils/on_boarding_rule.dart';
import 'package:user/views/home/widgets/current_events_widget_old.dart';
import 'package:user/views/home/widgets/event_complete_widget.dart';
import 'package:user/views/home/widgets/score_circles.dart';
import 'package:user/views/home/widgets/today_events_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EventController eventController = Get.put(EventController());
  late ConfettiController _confettiController;
  late EventStatusModel eventStatusModel;
  String _homeTitle = "E Week 2K24";

  @override
  void initState() {
    super.initState();
    addRule();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
    eventStatusModel = dateCalculator();

    if (eventStatusModel.isFinished) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _confettiController.play();
        _confettiController.addListener(() {
          if (_confettiController.state == ConfettiControllerState.stopped) {
            _confettiController.play();
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Score circles & header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ourLogo(size: w * .11),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            subHeadingText(text: _homeTitle),
                            dateText(text: eventStatusModel.currentDay)
                          ],
                        ),
                      ],
                    ),

                    ScoreCircles(),

                    subHeadingText(text: "Current Events"),
                    const SizedBox(height: 10),
                    CurrentEventsWidget(width: w),
                    const SizedBox(height: 20),

                    subHeadingText(text: "Today's Events"),
                    const SizedBox(height: 10),
                    TodayEventsWidget(width: w),
                  ],
                ),
              ),
            ),
          ),
          if (eventStatusModel.isFinished)
            EventCompleteWideget(confettiController: _confettiController),
        ],
      ),
    );
  }
}
