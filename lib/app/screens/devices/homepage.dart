import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:get/get.dart';
import '../../components/home_listview.dart';
import '../../components/reusable_textfield.dart';
import '../../components/search_result_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor:
                controller.isDarkMode ? Colors.black : Colors.white,
            appBar: AppBar(
              title: Row(
                children: [
                  Image.asset(
                    'assets/logos/flutter.png',
                    height: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Flutter Shikhi'),
                ],
              ),
              elevation: 0,
              backgroundColor:
                  controller.isDarkMode ? Colors.black : Colors.white,
              actions: [
                GetBuilder<SearchController>(
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
                child: GetBuilder<SearchController>(
                    init: SearchController(),
                    builder: (controller) {
                      return Column(
                        children: [
                          const SizedBox(height: 15),
                          ReusableTextFormField(
                            controller: controller,
                            searchController: controller.searchQuery,
                          ),
                          const SizedBox(height: 20),
                          controller.searchResult.isNotEmpty
                              ? SearchResultWidget(
                                  controller: controller,
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
