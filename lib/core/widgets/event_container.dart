import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/widgets/logo.dart';
import 'package:user/views/detail/event_detail_page.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class EventContainer extends StatelessWidget {
  EventContainer({super.key, required this.width, this.isAllEvent = false});

  final double width;
  bool? isAllEvent;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const EventDetailPage())),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.eventContainerColor,
              AppColors.backgroundColor
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor,
                  offset: Offset(0, 3),
                  blurRadius: 5)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  eventText(text: 'Event Name'),
                  if (!isAllEvent!) dateText(text: '08 : 24 a.m'),
                  if (isAllEvent!)
                    Row(
                      children: [
                        dateText(text: '08 : 24 a.m'),
                        const SizedBox(
                          width: 35,
                        ),
                        dateText(text: '29.10.2024'),
                      ],
                    )
                ],
              ),
            ),
            Hero(tag: 'eventPic', child: ourLogo(size: width * .1))
          ],
        ),
      ),
    );
  }
}
