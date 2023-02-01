import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BlogController extends GetxController {
  bool isDarkMode = GetStorage().read('isDarkMode') ?? false;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    Get.changeTheme(isDarkMode
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true));
    GetStorage().write('isDarkMode', isDarkMode);
    update();
  }

  final List<String> bengaliWeekNames = [
    'রবিবার',
    'সোমবার',
    'মঙ্গলবার',
    'বুধবার',
    'বৃহস্পতিবার',
    'শুক্রবার',
    'শনিবার'
  ];

  String weekDayToBengali(String weekDay) {
    switch (weekDay) {
      case 'Monday':
        return bengaliWeekNames[1];
      case 'Tuesday':
        return bengaliWeekNames[2];
      case 'Wednesday':
        return bengaliWeekNames[3];
      case 'Thursday':
        return bengaliWeekNames[4];
      case 'Friday':
        return bengaliWeekNames[5];
      case 'Saturday':
        return bengaliWeekNames[6];
      case 'Sunday':
        return bengaliWeekNames[0];
      default:
        return 'সমস্যা হয়েছে';
    }
  }


}
