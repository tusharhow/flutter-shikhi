import 'package:flutter/cupertino.dart';
import 'package:flutter_shikhi/app/data/data.dart';
import 'package:get/get.dart';

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
    print(searchResult);
  }
}
