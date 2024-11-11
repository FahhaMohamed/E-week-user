import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/views/home/widgets/circle_widget.dart';

class ScoreCircles extends StatelessWidget {
  final _pointsStream = FirebaseFirestore.instance
      .collection('points')
      .doc('total-points')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return StreamBuilder<DocumentSnapshot>(
      stream: _pointsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Error loading points"));
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(child: Text("No points data available"));
        }

        // Extract and sort data
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        var sortedTeams = data.entries.toList()
          ..sort((a, b) => (b.value as int).compareTo(a.value as int));

        return AnimatedSwitcher(
          duration: const Duration(
              milliseconds: 300), // Time for fade in and fade out effect
          child: SizedBox(
            height: w * .9,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // First place circle
                if (sortedTeams.length > 0)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    left: w * .1,
                    top: w * .12,
                    child: CircleWidget(
                      label: sortedTeams[0].key.toUpperCase(),
                      number: sortedTeams[0].value.toString(),
                      diameter: w * .4,
                    ),
                  ),

                // Second place circle
                if (sortedTeams.length > 1)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    right: w * .14,
                    top: w * .05,
                    child: CircleWidget(
                      label: sortedTeams[1].key.toUpperCase(),
                      number: sortedTeams[1].value.toString(),
                      diameter: w * .22,
                    ),
                  ),

                // Third place circle
                if (sortedTeams.length > 2)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    right: w * .11,
                    top: w * .33,
                    child: CircleWidget(
                      label: sortedTeams[2].key.toUpperCase(),
                      number: sortedTeams[2].value.toString(),
                      diameter: w * .2,
                    ),
                  ),

                // Fourth place circle
                if (sortedTeams.length > 3)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    right: w * .27,
                    top: w * .55,
                    child: CircleWidget(
                      label: sortedTeams[3].key.toUpperCase(),
                      number: sortedTeams[3].value.toString(),
                      diameter: w * .18,
                    ),
                  ),

                // Fifth place circle
                if (sortedTeams.length > 4)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    right: w * .50,
                    top: w * .65,
                    child: CircleWidget(
                      label: sortedTeams[4].key.toUpperCase(),
                      number: sortedTeams[4].value.toString(),
                      diameter: w * .15,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
