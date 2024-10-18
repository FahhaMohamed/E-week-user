import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/views/detail/widgets/team_score_tile.dart';

class TeamScoreTable extends StatefulWidget {
  final double width;
  const TeamScoreTable({super.key, required this.width});

  @override
  State<TeamScoreTable> createState() => _TeamScoreTableState();
}

class _TeamScoreTableState extends State<TeamScoreTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Team 1
        TeamScoresTile(
          width: widget.width,
          teamName: "E20",
          teamColor: AppColors.e20Color,
          teamScore: "20",
        ),

        const SizedBox(
          height: 20,
        ),

        //Team 2
        TeamScoresTile(
          width: widget.width,
          teamName: "E21",
          teamColor: AppColors.e21Color,
          teamScore: "21",
        ),

        const SizedBox(
          height: 20,
        ),

        //Team 3
        TeamScoresTile(
          width: widget.width,
          teamName: "E22",
          teamColor: AppColors.e22Color,
          teamScore: "20",
        ),

        const SizedBox(
          height: 20,
        ),

        //Team 4
        TeamScoresTile(
          width: widget.width,
          teamName: "E23",
          teamColor: AppColors.e23Color,
          teamScore: "20",
        ),

        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
