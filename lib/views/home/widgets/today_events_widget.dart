import 'package:flutter/material.dart';
import 'package:user/core/widgets/event_container.dart';

class TodayEventsWidget extends StatelessWidget {
  const TodayEventsWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return EventContainer(width: width);
          }),
    );
  }
}