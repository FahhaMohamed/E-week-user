import 'package:flutter/cupertino.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/widgets/logo.dart';

class EventDetails extends StatelessWidget {
  final double width;
  final String date;
  final String time;

  const EventDetails({
    super.key,
    required this.width,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(tag: 'eventPic', child: ourLogo(size: width * .4)),
        const SizedBox(
          height: 20,
        ),
        eventText(text: time),
        dateText(text: date),
        const SizedBox(
          height: 5,
        ),
        CupertinoButton(
            padding: const EdgeInsets.all(0),
            color: AppColors.iconColor,
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Event Points"),
              ],
            )),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
