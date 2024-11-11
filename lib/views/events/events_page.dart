import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/controllers/event_controller.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/contants/dates.dart';
import 'package:user/core/utils/heading_text.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/views/events/widgets/all_events.dart';
import 'package:user/views/events/widgets/day_container.dart';
import 'package:user/views/events/widgets/search_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  EventController eventController = Get.put(EventController());
  String selectedDay = 'All';
  bool isFilterOptionsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              dateList(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isFilterOptionsVisible) const SearchWidget(),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isFilterOptionsVisible ? 1.0 : 0.0,
                    child: isFilterOptionsVisible
                        ? Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            alignment: Alignment.center,
                            width: getScreenWidth(context) * .923,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        AppColors.shadowColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.shadowColor.withOpacity(.1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                filterButton(
                                  label: "All",
                                  isSelected:
                                      !eventController.isCompleted.value &&
                                          !eventController.isPending.value,
                                  color:
                                      const Color.fromARGB(255, 217, 240, 255),
                                  borderColor:
                                      const Color.fromARGB(255, 173, 224, 255),
                                  onTap: () {
                                    setState(() {
                                      eventController.isCompleted.value = false;
                                      eventController.isPending.value = false;
                                      eventController.applyFilters();
                                    });
                                  },
                                ),
                                filterButton(
                                  label: "Completed",
                                  isSelected: eventController.isCompleted.value,
                                  color:
                                      const Color.fromARGB(255, 225, 255, 242),
                                  borderColor:
                                      const Color.fromARGB(255, 184, 255, 224),
                                  onTap: () {
                                    setState(() {
                                      eventController.isCompleted.value = true;
                                      eventController.isPending.value = false;
                                      eventController.applyFilters();
                                    });
                                  },
                                ),
                                filterButton(
                                  label: "Pending",
                                  isSelected: eventController.isPending.value,
                                  color:
                                      const Color.fromARGB(255, 255, 239, 239),
                                  borderColor:
                                      const Color.fromARGB(255, 255, 209, 209),
                                  onTap: () {
                                    setState(() {
                                      eventController.isCompleted.value = false;
                                      eventController.isPending.value = true;
                                      eventController.applyFilters();
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFilterOptionsVisible = false;
                                    });
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ),
                  if (!isFilterOptionsVisible)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isFilterOptionsVisible = !isFilterOptionsVisible;
                          });
                        },
                        icon: const Icon(Icons.tune),
                      ),
                    ),
                ],
              ),
              const AllEvents(),
            ],
          ),
        ),
      ),
    );
  }

  Container dateList() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: eventDates.length,
        itemBuilder: (context, index) => ZoomTapAnimation(
          onTap: () {
            setState(() {
              selectedDay = eventDates[index];
              eventController.filterByDate(selectedDay);
            });
          },
          child: DayContainer(
            day: eventDates[index],
            isSelect: selectedDay == eventDates[index],
          ),
        ),
      ),
    );
  }

  Widget filterButton({
    required String label,
    required bool isSelected,
    required Color color,
    required Color borderColor,
    required VoidCallback onTap,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.85, end: isSelected ? 1.0 : 0.85),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: color,
                border: Border.all(color: borderColor),
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
              child: subHeadingText(text: label),
            ),
          ),
        );
      },
    );
  }
}
