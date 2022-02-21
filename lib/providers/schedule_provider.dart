import 'package:flutter/material.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/models/calender_event.dart';

class ScheduleProvider extends ChangeNotifier {
  int selectedMonthIdx = 0;
  int selectedDayIdx = 0;
  int currentEventIndex = 0;

  final List<CalenderEvent> events = [
    CalenderEvent("08:00", "10:00", "Cadillac Escalade", "FN278YZ", "Xtra",
        "Velvet", AppColors.eventStripColorGreen, 0, 2),
    CalenderEvent("10:00", "12:00", "Cadillac Escalade", "FN278YZ", "Xtra",
        "Velvet", AppColors.eventStripColorYellow, 2, 4),
    CalenderEvent("12:00", "14:00", "Cadillac Escalade", "FN278YZ", "Xtra",
        "Velvet", AppColors.eventStripColorYellow, 4, 6),
    CalenderEvent("14:00", "16:00", "Cadillac Escalade", "FN278YZ", "Xtra",
        "Velvet", AppColors.eventStripColorRed, 6, 8),
    CalenderEvent("18:00", "21:00", "Cadillac Escalade", "FN278YZ", "Xtra",
        "Velvet", AppColors.eventStripColorPurple, 10, 14),
  ];

  void switchMonthToIdx(int idx) {
    selectedMonthIdx = idx;
    notifyListeners();
  }

  void switchDayToIdx(int idx) {
    selectedDayIdx = idx;
    notifyListeners();
  }
}
