import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/views/detail/widgets/team_score_tile.dart';

class TeamScoreTable extends StatefulWidget {
  final double width;
  final Future<List<MapEntry<String, dynamic>>> scores;

  const TeamScoreTable({Key? key, required this.width, required this.scores})
      : super(key: key);

  @override
  State<TeamScoreTable> createState() => _TeamScoreTableState();
}

class _TeamScoreTableState extends State<TeamScoreTable> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MapEntry<String, dynamic>>>(
      future: widget.scores,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No scores available'));
        }

        final entries = snapshot.data!;

        return Column(
          children: entries.map((entry) {
            Color teamColor;

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
              case 'staff':
                teamColor = AppColors.staffColor;
                break;
              default:
                teamColor = Colors.grey;
            }

            return Column(
              children: [
                TeamScoresTile(
                  width: widget.width,
                  teamName: entry.key.toUpperCase(),
                  teamColor: teamColor,
                  teamScore: entry.value.toString(),
                ),
                const SizedBox(height: 20),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
