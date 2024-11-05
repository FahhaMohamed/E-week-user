import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/views/detail/widgets/team_score_tile.dart';

class TeamScoreTable extends StatefulWidget {
  final double width;
  final Map<String, int> scores;

  const TeamScoreTable({Key? key, required this.width, required this.scores}) : super(key: key);

  @override
  State<TeamScoreTable> createState() => _TeamScoreTableState();
}

class _TeamScoreTableState extends State<TeamScoreTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.scores.entries.map((entry) {
        Color teamColor;

        // Assign colors based on team name (key)
        switch (entry.key) {
          case 'e20':
            teamColor = AppColors.e20Color;
            break;
          case 'e21':
            teamColor = AppColors.e21Color;
            break;
          case 'e22':
            teamColor = AppColors.e22Color;
            break;
          case 'e23':
            teamColor = AppColors.e23Color;
            break;
          default:
            teamColor = Colors.grey; // Default color for unrecognized teams
        }

        return Column(
          children: [
            TeamScoresTile(
              width: widget.width,
              teamName: entry.key.toUpperCase(), // Display key (e.g., "E20")
              teamColor: teamColor,
              teamScore: entry.value.toString(), // Display score as string
            ),
            const SizedBox(height: 20),
          ],
        );
      }).toList(),
    );
  }
}
