import 'package:flutter/material.dart';
import '../controllers/search_controller.dart';

class ReusableTextFormField extends StatelessWidget {
  ReusableTextFormField({
    Key? key,
    required this.controller,
    required this.searchController,
  }) : super(key: key);
  TextEditingController searchController;
  final SearchController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 5,
        child: TextFormField(
          style: TextStyle(
              color: controller.isDarkMode ? Colors.white : Colors.black45),
          onChanged: (String query) {
            if (query.isNotEmpty) {
              controller.searchPost(query);
              controller.update();
            } else {
              controller.searchResult.clear();
              controller.update();
            }
          },
          controller: searchController,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            hintText: 'Search a topic',
            hintStyle: TextStyle(
                color: controller.isDarkMode ? Colors.white : Colors.black38),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: searchController.text.isEmpty
                ? null
                : IconButton(
                    onPressed: () {
                      searchController.clear();
                      controller.searchResult.clear();
                      controller.update();
                    },
                    icon: Icon(
                      Icons.clear,
                      color:
                          controller.isDarkMode ? Colors.white : Colors.black38,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
