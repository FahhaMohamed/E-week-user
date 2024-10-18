import 'package:flutter/material.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/core/widgets/event_container.dart';

class AllEvents extends StatelessWidget {
  const AllEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return Expanded(
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return EventContainer(
              width: w,
              isAllEvent: true,
            );
          }),
    );
  }
}
