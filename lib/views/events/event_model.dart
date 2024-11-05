import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String eventName;
  final String date;
  final String time;
  final int totalPoints;
  final bool completed;

  Event({
    required this.id,
    required this.eventName,
    required this.date,
    required this.time,
    required this.totalPoints,
    required this.completed,
  });

  factory Event.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Event(
      id: doc.id,
      eventName: data['eventName'] ?? '',
      date: data['date'] ?? '',
      time: data['time'] ?? '',
      totalPoints: data['totalPoints'] ?? 0,
      completed: data['completed'] ?? false,
    );
  }
}
