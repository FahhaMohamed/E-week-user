import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/views/detail/widgets/event_details.dart';
import 'package:user/views/detail/widgets/team_score_table.dart';

import '../events/event_model.dart';

class EventDetailPage extends StatefulWidget {
  final String eventId;

  const EventDetailPage({Key? key, required this.eventId}) : super(key: key);

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  late Future<Event> eventFuture;
  late Future<Map<String, int>> scoresFuture;

  Future<Event> fetchEventDetails() async {
    final doc = await FirebaseFirestore.instance.collection('events').doc(widget.eventId).get();
    return Event.fromFirestore(doc);
  }

  Future<Map<String, int>> fetchScores() async {
    final doc = await FirebaseFirestore.instance.collection('events').doc(widget.eventId).get();
    final data = doc.data() as Map<String, dynamic>;
    return {
      'e20': data['e20'] ?? 0,
      'e21': data['e21'] ?? 0,
      'e22': data['e22'] ?? 0,
      'e23': data['e23'] ?? 0,
      // Add more score fields as needed
    };
  }

  @override
  void initState() {
    super.initState();
    eventFuture = fetchEventDetails();
    scoresFuture = fetchScores(); // Fetch scores when the page initializes
  }

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: subHeadingText(text: "Event Details"),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.iconColor),
              ),
            ),
            FutureBuilder<Event>(
              future: eventFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(child: Text("Event not found"));
                }

                final event = snapshot.data!;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        EventDetails(
                          date: event.date,
                          time: event.time,
                          width: w,
                        ),
                        FutureBuilder<Map<String, int>>(
                          future: scoresFuture,
                          builder: (context, scoreSnapshot) {
                            if (scoreSnapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (!scoreSnapshot.hasData) {
                              return Center(child: Text("Scores not found"));
                            }

                            final scores = scoreSnapshot.data!;
                            return TeamScoreTable(width: w, scores: scores);
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
    );
  }
}
