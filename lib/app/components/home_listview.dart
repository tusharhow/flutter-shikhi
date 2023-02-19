import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/models/post_model.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../controllers/search_controller.dart';
import '../data/data.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogController>(
        init: BlogController(),
        builder: (controller) {
          final postController = Get.put(PostController());
          return FutureBuilder<List<PostModel>>(
              future: postController.fetchPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 6,
                    ),
                    itemBuilder: (context, index) {
                      final topic = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 1,
                          child: ListTile(
                            title: Center(
                              child: Text(
                                topic.title,
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
                            tileColor: controller.isDarkMode
                                ? Colors.black12
                                : Colors.white,
                            onTap: () {
                              context.push('/${topic.subtitle}');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              });
        });
  }
}
