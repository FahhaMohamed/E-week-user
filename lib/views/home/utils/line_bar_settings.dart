import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

LineChartBarData lineChartBarData(List<FlSpot> spots, Color color) {
  return LineChartBarData(
      spots: spots,
      isCurved: false,
      color: color,
      barWidth: 3,
      dotData: const FlDotData(
        show: true,
      ),
      shadow: const Shadow(
          color: Color.fromARGB(255, 76, 76, 76),
          offset: Offset(4, 0),
          blurRadius: 2));
}
