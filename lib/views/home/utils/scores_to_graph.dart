//creating spots
//map teams' scores into fl_chart data point -> then only can plot

import 'package:fl_chart/fl_chart.dart';
import 'package:user/models/team_scores_model.dart';

List<FlSpot> createLineChartDataForTeam(int teamIndex) {
  List<FlSpot> spots = [];

  for (int i = 0; i < teamScores.length; i++) {
    int score;

    switch (teamIndex) {
      case 0:
        score = teamScores[i].teamE20;
        break;
      case 1:
        score = teamScores[i].teamE21;
        break;
      case 2:
        score = teamScores[i].teamE22;
        break;
      case 3:
        score = teamScores[i].teamE23;
        break;
      case 4:
        score = teamScores[i].teamStaff;
        break;
      default:
        score = 0;
    }

    spots.add(FlSpot(i.toDouble(), score.toDouble()));
  }

  return spots;
}
