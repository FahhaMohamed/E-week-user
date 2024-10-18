import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/heading_text.dart';

class DayContainer extends StatelessWidget {
  const DayContainer({
    super.key,
    required this.isSelect,
    required this.day,
  });

  final bool isSelect;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 45,
      width: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: isSelect ? AppColors.iconColor : AppColors.dateContainerColor,
          borderRadius: BorderRadius.circular(10)),
      child: dayText(day: day, isSelect: isSelect),
    );
  }
}
