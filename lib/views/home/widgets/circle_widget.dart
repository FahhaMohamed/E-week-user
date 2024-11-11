import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';

class CircleWidget extends StatelessWidget {
  final String label;
  final String number;
  final double diameter;

  const CircleWidget({
    super.key,
    required this.label,
    required this.number,
    required this.diameter,
  });

  @override
  Widget build(BuildContext context) {
    Color circleColor = label == "E20"
        ? AppColors.e20Color
        : label == "E21"
            ? AppColors.e21Color
            : label == "E22"
                ? AppColors.e22Color
                : label == "STAFF"
                    ? AppColors.staffColor
                    : AppColors.e23Color;

    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
          color: circleColor,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
                color: AppColors.shadowColor,
                offset: Offset(0, 5),
                blurRadius: 8)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: diameter * 0.2, // Adjust size based on diameter
              color: AppColors.iconColor,
            ),
          ),
          Text(
            number,
            style: TextStyle(
              fontSize: diameter * 0.4, // Larger text for the number
              color: AppColors.iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
