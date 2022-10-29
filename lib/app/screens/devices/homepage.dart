import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:get/get.dart';
import '../../components/home_listview.dart';
import '../../components/reusable_textfield.dart';
import '../../components/search_result_widget.dart';
import '../../data/data.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogController>(
        init: BlogController(),
        builder: (controller) {
          final postController = Get.put(PostController());
          return Scaffold(
            backgroundColor: controller.isDarkMode
                ? const Color(0xff303030)
                : const Color(0xffFAFAFA),
            appBar: AppBar(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logos/logo.png',
                    height: 50,
                  ),
                  Text(
                    'ফ্লাটার শিখি',
                    style: TextStyle(
                      fontSize: 22,
                      color:
                          controller.isDarkMode ? Colors.white : Colors.black,
                      fontFamily: 'Borno',
                    ),
                  ),
                ],
              ),
              elevation: 0,
              backgroundColor: controller.isDarkMode
                  ? const Color(0xff303030)
                  : const Color(0xffFAFAFA),
              actions: [
                GetBuilder<BlogController>(
                    builder: (controller) => IconButton(
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            controller.isDarkMode
                                ? Icons.dark_mode
                                : Icons.light_mode,
                          ),
                        ),
                        onPressed: () => controller.toggleDarkMode()))
              ],
            ),
            body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: GetBuilder<BlogController>(
                    init: BlogController(),
                    builder: (controller) {
                      return Column(
                        children: [
                          const SizedBox(height: 20),
                          ReusableTextFormField(
                            controller: controller,
                            textController: postController.searchQuery,
                            postController: postController,
                          ),
                          const SizedBox(height: 20),
                          postController.searhResults.isNotEmpty
                              ? SearchResultWidget(
                                  controller: controller,
                                  postController: postController,
                                )
                              : const HomeListView(),
                          const SizedBox(height: 16),
                        ],
                      );
                    })),
          );
        });
  }
}
