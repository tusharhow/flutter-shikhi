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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Flutter Shikhi'),
        elevation: 0,
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
  }
}
