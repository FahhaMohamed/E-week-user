import 'package:flutter/material.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/core/widgets/logo.dart';
import 'package:user/views/home/widgets/fl_chart.dart';
import 'package:user/views/home/widgets/score_circles.dart';
import 'package:user/views/home/widgets/today_events_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

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
                    dateText(text: "DAY 1")
                  ],
                ),
              ],
            ),

            const ScoreCircles(),

            //score statistics----------------------------------------------------

            subHeadingText(text: "Statistics"),

            SizedBox(
              height: 300,
              child: flChart(),
            ),

            const SizedBox(
              height: 30,
            ),

            //today events----------------------------------------------------

            subHeadingText(text: "Today's Events"),

            const SizedBox(
              height: 10,
            ),

            TodayEventsWidget(width: w)
          ],
        ),
      ),
    )));
  }
}
