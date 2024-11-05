import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/screen_width.dart';
import '../../../core/widgets/event_container.dart';
import '../../detail/event_detail_page.dart';
import '../event_model.dart';

class AllEvents extends StatelessWidget {
  const AllEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('events').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No events available"));
          }

          final events = snapshot.data!.docs.map((doc) => Event.fromFirestore(doc)).toList();

          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventDetailPage(eventId: event.id),
                    ),
                  );
                },
                child: EventContainer(
                  width: w,
                  eventId: event.id,             // Pass the event ID to EventContainer
                  eventName: event.eventName,     // Pass the event name
                  date: event.date,               // Pass the event date
                  time: event.time,               // Pass the event time
                  isAllEvent: true,               // Indicate it's in AllEvents view
                ),
              );
            },
          );
        },
      ),
    );
  }
}
