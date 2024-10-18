import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/contants/dimensions.dart';

Text subHeadingText({required String text}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: AppDimensions.headingFontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.iconColor),
  );
}

Text eventText({required String text}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        color: AppColors.iconColor, fontSize: AppDimensions.eventFontSize),
  );
}

Text dateText({required String text}) {
  return Text(
    text,
    style: TextStyle(fontSize: AppDimensions.dateFontSize),
  );
}

Text scoreText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
        color: AppColors.iconColor, fontSize: 17, fontWeight: FontWeight.bold),
  );
}

Text dayText({required String day, required bool isSelect}) {
  return Text(
    day,
    style: TextStyle(
        color: isSelect ? AppColors.backgroundColor : AppColors.iconColor,
        fontSize: 25),
  );
}
