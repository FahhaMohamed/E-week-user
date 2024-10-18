import 'package:flutter/material.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/views/home/widgets/circle_widget.dart';

class ScoreCircles extends StatelessWidget {
  const ScoreCircles({super.key});

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return SizedBox(
      height: w * .8, //330
      child: Stack(
        alignment: Alignment.center,
        children: [
          // first place circle
          Positioned(
            left: w * .1, //50
            top: w * .12, //60
            child: CircleWidget(
              label: 'E21',
              number: '33',
              diameter: w * .4,
            ),
          ),

          // second place circle
          Positioned(
            right: w * .14, //60
            top: w * .05, //20
            child: CircleWidget(
              label: 'E20',
              number: '30',
              diameter: w * .22,
            ),
          ),

          // third place circle
          Positioned(
            right: w * .11, //40
            top: w * .33, //130
            child: CircleWidget(
              label: 'E22',
              number: '25',
              diameter: w * .2,
            ),
          ),

          // fourth place circle
          Positioned(
            right: w * .27, //100
            top: w * .55, //100
            child: CircleWidget(
              label: 'E23',
              number: '20',
              diameter: w * .18,
            ),
          ),
        ],
      ),
    );
  }
}
