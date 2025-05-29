import 'package:user/core/contants/global.dart';
import 'package:user/models/event_status_model.dart';

EventStatusModel dateCalculator() {
  final DateTime now = DateTime.now();
  final DateTime startDate = DateTime(2024, 11, 23);
  final DateTime endDate = DateTime(2024, 11, 29);

  String _currentDay;

  if (now.isBefore(startDate)) {
    final int daysLeft = startDate.difference(now).inDays;
    _currentDay = 'Start Within $daysLeft Days';
    return EventStatusModel(currentDay: _currentDay, isFinished: false);
  } else if (now.isAfter(endDate)) {
    final int daysAgo = now.difference(endDate).inDays;

    if (daysAgo > 366) {
      int yearsAgo = (daysAgo / 365).floor();
      _currentDay =
          'All Events Finished $yearsAgo Year${yearsAgo > 1 ? 's' : ''} ago';
    } else if (daysAgo > 31) {
      int monthsAgo = (daysAgo / 30).floor();
      _currentDay =
          'All Events Finished $monthsAgo Month${monthsAgo > 1 ? 's' : ''} ago';
    } else {
      _currentDay = "All Events Finished${daysAgo != 0 ? ' $daysAgo Days ago' : ''}";
    }
    return EventStatusModel(currentDay: _currentDay, isFinished: true);
  } else {
    _currentDay = todayDay(now.day);
    return EventStatusModel(currentDay: _currentDay, isFinished: false);
  }
}
