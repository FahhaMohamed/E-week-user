import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:user/models/event_model.dart';

class EventController extends GetxController {
  var events = <Event>[].obs;
  var filteredEvents = <Event>[].obs;
  var isLoading = false.obs;
  var hasError = false.obs;
  var isCompleted = false.obs;
  var isPending = false.obs;
  var searchTerm = ''.obs;
  String selectedDate = 'All';
  String dateFormat = '11.2024';

  @override
  void onInit() {
    super.onInit();
    fetchEvents();

    debounce(searchTerm, (_) => applyFilters(),
        time: const Duration(milliseconds: 300));
  }

  void fetchEvents() async {
    isLoading(true);
    hasError(false);
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('events').get();

      events.value =
          snapshot.docs.map((doc) => Event.fromFirestore(doc)).toList();
      applyFilters();
    } catch (e) {
      hasError(true);
      log('Error fetching events: $e');
    } finally {
      isLoading(false);
    }
  }

  void applyFilters() {
    var results = events.value;

    if (selectedDate != 'All') {
      results = results
          .where((event) => event.date == "$selectedDate.$dateFormat")
          .toList();
    }

    if (searchTerm.isNotEmpty) {
      results = results
          .where((event) =>
              event.eventName.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }

    if (isCompleted.value) {
      results = results
          .where((event) => event.completed == isCompleted.value)
          .toList();
    }
    
    if (isPending.value) {
      results = results
          .where((event) => event.completed == !isPending.value)
          .toList();
    }

    filteredEvents.value = results;
  }

  void filterByDate(String date) {
    selectedDate = date;
    applyFilters();
  }

  void setSearchTerm(String term) {
    searchTerm.value = term;
  }
}
