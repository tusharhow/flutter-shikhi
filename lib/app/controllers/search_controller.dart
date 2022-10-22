import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/data/data.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class SearchController extends GetxController {
  final searchResult = [];
  final TextEditingController searchQuery = TextEditingController();

  Future<void> searchPost(String query) async {
    for (final post in topicData) {
      if (post['title']!.toLowerCase().contains(query.toLowerCase()) ||
          post['desc1']!.toLowerCase().contains(query.toLowerCase()) ||
          post['desc2']!.toLowerCase().contains(query.toLowerCase()) ||
          post['desc3']!.toLowerCase().contains(query.toLowerCase()) ||
          post['desc4']!.toLowerCase().contains(query.toLowerCase()) ||
          post['desc5']!.toLowerCase().contains(query.toLowerCase())) {
        searchResult.remove(post);
        searchResult.add(post);
      }
    }
    update();
  }

  // generate related posts
  final relatedPosts = [];
  List<dynamic> relatedPostsFunc(String title) {
    for (final post in topicData) {
      if (post['title']!.toLowerCase().contains(title.toLowerCase())) {
        relatedPosts.add(post);
      }
    }
    return relatedPosts;
  }

  bool isDarkMode = GetStorage().read('isDarkMode') ?? false;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    Get.changeTheme(isDarkMode
        ? ThemeData.dark(
            useMaterial3: true,
          )
        : ThemeData.light(
            useMaterial3: true,
          ));
    GetStorage().write('isDarkMode', isDarkMode);
    update();
  }

  // bengali week names
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
