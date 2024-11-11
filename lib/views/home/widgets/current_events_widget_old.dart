import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/widgets/custom_shimmer.dart';
import 'package:user/core/widgets/event_container.dart';
import 'package:user/models/event_model.dart';

class CurrentEventsWidget extends StatelessWidget {
  CurrentEventsWidget({
    super.key,
    required this.width,
  });

  final double width;

  final _userStream = FirebaseFirestore.instance.collection('events');

  @override
  Widget build(BuildContext context) {
    String todayDate = DateFormat('dd.MM.yyyy').format(DateTime.now());

    DateTime now = DateTime.now();

    String oneHourBefore = DateFormat('hh:mm a')
        .format(now.subtract(const Duration(hours: 1)))
        .toLowerCase();
    String oneHourAfter = DateFormat('hh:mm a')
        .format(now.add(const Duration(hours: 1)))
        .toLowerCase();

    return StreamBuilder<QuerySnapshot>(
        stream: _userStream
            .where('date', isEqualTo: todayDate)
            .where('time', isGreaterThanOrEqualTo: oneHourBefore)
            .where('time', isLessThanOrEqualTo: oneHourAfter)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomShimmer(
                      height: 70,
                      width: width,
                      radius: 15,
                    ),
                  );
                });
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset(
                      'assets/lottie/no-events.json',
                      width: width * .5,
                    ),
                  ),
                  const Text(
                    "Currently no events available.",
                    style: TextStyle(color: AppColors.emptyEventColor),
                  )
                ]);
          }

          final events = snapshot.data!.docs
              .map((doc) => Event.fromFirestore(doc))
              .toList();

          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: events.length,
              itemBuilder: (context, index) {
                var event = events[index];
                return EventContainer(
                  totalPoints: event.totalPoints,
                  width: width,
                  eventName: event.eventName,
                  date: '',
                  time: event.time,
                  eventId: event.id,
                  completed: event.completed,
                  imageUrl: event.imageUrl,
                );
              });
        });
  }
}
