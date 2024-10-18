import 'package:flutter/material.dart';
import 'package:user/views/events/events_page.dart';
import 'package:user/views/home/home_page.dart';
import 'package:user/views/info/info_page.dart';

class BottomNavModel {
  final Icon icon;
  final String label;
  final Widget page;

  BottomNavModel({required this.icon, required this.label, required this.page});
}

List<BottomNavModel> bottomNavItems = [
  BottomNavModel(
    icon: const Icon(Icons.home_rounded),
    label: "Home",
    page: const HomePage(),
  ),
  BottomNavModel(
    icon: const Icon(Icons.calendar_month_rounded),
    label: "Events",
    page: const EventsPage(),
  ),
  BottomNavModel(
    icon: const Icon(Icons.info_rounded),
    label: "Info",
    page: const InfoPage(),
  ),
];
