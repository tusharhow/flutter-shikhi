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
    return GetBuilder<BlogController>(
        init: BlogController(),
        builder: (controller) {
          return GridView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: topicData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 6,
            ),
            itemBuilder: (context, index) {
              final topic = topicData[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Center(
                    child: Text(
                      topic['title'],
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: 'Borno',
                        fontWeight: FontWeight.bold,
                        color: controller.isDarkMode
                            ? Colors.white60
                            : Colors.black54,
                      ),
                    ),
                  ),
                  hoverColor: controller.isDarkMode
                      ? Colors.blue.shade300
                      : Colors.blue.shade100,
                  tileColor:
                      controller.isDarkMode ? Colors.black12 : Colors.white,
                  onTap: () {
                    controller.relatedPostsFunc(topic['title']);
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
                ),
              );
            },
          );
        });
  }
}
