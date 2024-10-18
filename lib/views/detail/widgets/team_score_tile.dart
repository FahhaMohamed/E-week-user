import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/heading_text.dart';

class TeamScoresTile extends StatelessWidget {
  const TeamScoresTile({
    super.key,
    required this.width,
    required this.teamName,
    required this.teamScore,
    required this.teamColor,
  });

  final double width;
  final String teamName;
  final String teamScore;
  final Color teamColor;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          TableCell(
            child: Container(
              width: width * .09,
              height: width * .09,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.iconColor, width: 2),
                  color: teamColor,
                  shape: BoxShape.circle),
            ),
          ),
          TableCell(
            child: subHeadingText(text: teamName),
          ),
          TableCell(
            child: Row(
              children: [
                eventText(text: "POINTS: "),
                scoreText(text: teamScore),
              ],
            ),
          ),
        ])
      ],
    );
  }
}
