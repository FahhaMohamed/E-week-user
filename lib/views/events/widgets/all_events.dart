import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/controllers/event_controller.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/widgets/custom_shimmer.dart';

import '../../../core/utils/screen_width.dart';
import '../../../core/widgets/event_container.dart';
import '../../detail/event_detail_page.dart';

class AllEvents extends StatelessWidget {
  const AllEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    EventController eventController = Get.put(EventController());

    return Obx(() => eventController.isLoading.value
        ? Expanded(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomShimmer(
                      height: 70,
                      width: w,
                      radius: 15,
                    ),
                  );
                }),
          )
        : eventController.hasError.value
            ? Center(
                child: subHeadingText(
                    text: "Oops! Something went wrong, try again."),
              )
            : eventController.filteredEvents.isEmpty
                ? Center(
                    child: subHeadingText(text: "No events available."),
                  )
                : Expanded(
                    child: RefreshIndicator(
                      color: Colors.red,
                      backgroundColor: Colors.black,
                      onRefresh: () async {
                        eventController.fetchEvents();
                      },
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        itemCount: eventController.filteredEvents.length,
                        itemBuilder: (context, index) {
                          final event = eventController.filteredEvents[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventDetailPage(
                                    imageUrl: event.imageUrl,
                                    eventId: event.id,
                                    totalPoints: event.totalPoints,
                                    eventName: event.eventName,
                                  ),
                                ),
                              );
                            },
                            child: EventContainer(
                              totalPoints: event.totalPoints,
                              width: w,
                              eventId: event.id,
                              eventName: event.eventName,
                              date: event.date,
                              time: event.time,
                              isAllEvent: true,
                              completed: event.completed,
                              imageUrl: event.imageUrl,
                            ),
                          );
                        },
                      ),
                    ),
                  ));
  }
}
