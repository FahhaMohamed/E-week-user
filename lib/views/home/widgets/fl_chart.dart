import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/models/team_scores_model.dart';
import 'package:user/views/home/utils/line_bar_settings.dart';
import 'package:user/views/home/utils/scores_to_graph.dart';

Widget flChart() {
  return Padding(
    padding: const EdgeInsets.only(top: 20, right: 10),
    child: LineChart(LineChartData(
        maxX: 6,
        minX: 0,
        backgroundColor: AppColors.flChartBackgroundColor,
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            axisNameWidget: Text("Points"),
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          bottomTitles: AxisTitles(
              axisNameWidget: const Text("Days"),
              sideTitles: SideTitles(
                  interval: 1,
                  reservedSize: 20,
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value < teamScores.length) {
                      return Text(teamScores[value.toInt()].day);
                    } else {
                      return const Text("");
                    }
                  })),
        ),
        borderData: FlBorderData(show: true, border: const Border()),
        gridData: const FlGridData(show: false),
        lineBarsData: [
          lineChartBarData(createLineChartDataForTeam(0),
              const Color.fromARGB(255, 255, 244, 150)),
          lineChartBarData(createLineChartDataForTeam(1),
              const Color.fromARGB(255, 255, 177, 160)),
          lineChartBarData(createLineChartDataForTeam(2),
              const Color.fromARGB(255, 149, 220, 255)),
          lineChartBarData(createLineChartDataForTeam(3),
              const Color.fromARGB(255, 242, 169, 255)),
        ])),
  );
}
