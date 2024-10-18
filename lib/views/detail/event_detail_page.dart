import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/views/detail/widgets/event_details.dart';
import 'package:user/views/detail/widgets/team_score_table.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //App bar
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: subHeadingText(text: "Event Name"),
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.iconColor,
                )),
          ),

          //content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //event
                  EventDetails(
                    date: "29.10.2024",
                    time: "08.24 am",
                    width: w,
                    
                  ),

                  //Teams with points

                  TeamScoreTable(width: w),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
