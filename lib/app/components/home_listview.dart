import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_controller.dart';
import '../data/data.dart';
import '../screens/details_page.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (controller) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: topicData.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final topic = topicData[index];

                return ListTile(
                  title: Text(
                    topic['title'],
                    style: TextStyle(
                      fontFamily: 'Borno',
                      fontSize: 20,
                      color:
                          controller.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  leading: const Icon(
                    Icons.widgets,
                    color: Colors.blue,
                  ),
                  subtitle: Text(
                    topic['subtitle'],
                    style: TextStyle(
                      fontFamily: 'GolestaBorno',
                      fontSize: 15,
                      color: controller.isDarkMode
                          ? Colors.white54
                          : Colors.black54,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => DetailsPage(
                          data: topic,
                        ),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              });
        });
  }
}
