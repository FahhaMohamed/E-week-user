import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/widgets/logo.dart';
import 'package:user/views/detail/event_detail_page.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class EventContainer extends StatelessWidget {
  final double width;
  final String eventId; // Added eventId parameter
  final String eventName;
  final String date;
  final String time;
  final bool isAllEvent;

  const EventContainer({
    Key? key,
    required this.width,
    required this.eventId, // Initialize eventId
    required this.eventName,
    required this.date,
    required this.time,
    this.isAllEvent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => EventDetailPage(eventId: eventId), // Pass the eventId here
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.eventContainerColor,
              AppColors.backgroundColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              offset: Offset(0, 3),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  eventText(text: eventName),
                  if (!isAllEvent) dateText(text: time),
                  if (isAllEvent)
                    Row(
                      children: [
                        dateText(text: time),
                        const SizedBox(width: 35),
                        dateText(text: date),
                      ],
                    ),
                ],
              ),
            ),
            Hero(
              tag: 'eventPic-$eventId', // Unique tag based on eventId
              child: ourLogo(size: width * .1),
            ),
          ],
        ),
      ),
    );
  }
}
