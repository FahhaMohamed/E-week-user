import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/controllers/event_controller.dart';
import 'package:user/core/contants/global.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/core/widgets/logo.dart';
import 'package:user/views/home/widgets/current_events_widget_old.dart';
import 'package:user/views/home/widgets/score_circles.dart';
import 'package:user/views/home/widgets/today_events_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EventController eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);
    String currentDay = DateTime.now().day < 23
        ? 'Start within ${23 - (DateTime.now().day)} DAYS'
        : DateTime.now().day > 29
            ? 'All events finished before ${(DateTime.now().day) - 29}'
            : todayDay(DateTime.now().day);

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //score circles----------------------------------------------------

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ourLogo(size: w * .11),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    subHeadingText(text: "E Week 2K24"),
                    dateText(text: currentDay)
                  ],
                ),
              ],
            ),

            ScoreCircles(),

            //current events----------------------------------------------------

            subHeadingText(text: "Current Events"),

            const SizedBox(
              height: 10,
            ),

            CurrentEventsWidget(width: w),
            const SizedBox(
              height: 20,
            ),

            subHeadingText(text: "Today's Events"),

            const SizedBox(
              height: 10,
            ),

            TodayEventsWidget(width: w),
          ],
        ),
      ),
    )));
  }
}
