import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/core/widgets/custom_shimmer.dart';
import 'package:user/core/widgets/logo_loading_widget.dart';
import 'package:user/views/detail/widgets/event_details.dart';
import 'package:user/views/detail/widgets/team_score_table.dart';

import '../../models/event_model.dart';

class EventDetailPage extends StatefulWidget {
  final String eventId;
  final String imageUrl;
  final String eventName;
  final int totalPoints;

  const EventDetailPage(
      {super.key,
      required this.eventId,
      required this.totalPoints,
      required this.eventName, required this.imageUrl});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  late Future<Event> eventFuture;
  late Future<List<MapEntry<String, dynamic>>> scoresFuture;

  Future<Event> fetchEventDetails() async {
    final doc = await FirebaseFirestore.instance
        .collection('events')
        .doc(widget.eventId)
        .get();
    return Event.fromFirestore(doc);
  }

  Future<List<MapEntry<String, dynamic>>> fetchScores() async {
    final doc = await FirebaseFirestore.instance
        .collection('events')
        .doc(widget.eventId)
        .get();
    final data = doc.data() as Map<String, dynamic>;
    var m_data = {
      'e20': data['e20'] ?? 0,
      'e21': data['e21'] ?? 0,
      'e22': data['e22'] ?? 0,
      'e23': data['e23'] ?? 0,
      'staff': data['staff'] ?? 0,
    };

    var sortedTeams = m_data.entries.toList()
      ..sort((a, b) => (b.value as int).compareTo(a.value as int));

    return sortedTeams;
  }

  @override
  void initState() {
    super.initState();
    eventFuture = fetchEventDetails();
    scoresFuture = fetchScores();
  }

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: subHeadingText(text: widget.eventName),
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new,
                      color: AppColors.iconColor),
                ),
              ),
              FutureBuilder<Event>(
                future: eventFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        LogoLoadingWidget(width: w * .4),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomShimmer(
                          height: 20,
                          width: 100,
                          radius: 6,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        CustomShimmer(
                          height: 20,
                          width: 130,
                          radius: 6,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomShimmer(
                          height: 50,
                          width: w,
                          radius: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            CustomShimmer(
                              height: 50,
                              width: w * .9,
                              radius: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomShimmer(
                              height: 50,
                              width: w * .9,
                              radius: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomShimmer(
                              height: 50,
                              width: w * .9,
                              radius: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomShimmer(
                              height: 50,
                              width: w * .9,
                              radius: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomShimmer(
                              height: 50,
                              width: w * .9,
                              radius: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                        child: dayText(
                            day: "Unstable network connection.",
                            isSelect: false));
                  }
                  if (!snapshot.hasData) {
                    return Center(
                        child:
                            dayText(day: "Event not found", isSelect: false));
                  }

                  final event = snapshot.data!;
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          EventDetails(
                            image: widget.imageUrl,
                            totalPoints: widget.totalPoints,
                            date: event.date,
                            time: event.time,
                            width: w,
                          ),
                          FutureBuilder<List<MapEntry<String, dynamic>>>(
                            future: scoresFuture,
                            builder: (context, scoreSnapshot) {
                              if (scoreSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Column(
                                  children: [
                                    CustomShimmer(
                                      height: 50,
                                      width: w * .9,
                                      radius: 10,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomShimmer(
                                      height: 50,
                                      width: w * .9,
                                      radius: 10,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomShimmer(
                                      height: 50,
                                      width: w * .9,
                                      radius: 10,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomShimmer(
                                      height: 50,
                                      width: w * .9,
                                      radius: 10,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomShimmer(
                                      height: 50,
                                      width: w * .9,
                                      radius: 10,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
                              }
                              if (!scoreSnapshot.hasData) {
                                return Center(child: Text("Scores not found"));
                              }

                              final scores = scoreSnapshot.data!;
                              return TeamScoreTable(width: w, scores: scoresFuture);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
