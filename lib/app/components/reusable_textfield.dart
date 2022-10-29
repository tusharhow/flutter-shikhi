import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:flutter_shikhi/app/data/data.dart';

class ReusableTextFormField extends StatelessWidget {
  ReusableTextFormField({
    Key? key,
    required this.controller,
    required this.textController, required this.postController,
  }) : super(key: key);
  TextEditingController textController;
  final BlogController controller;
  final PostController postController;

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
              postController.searchPosts(query);
              controller.update();
            } else {
              postController.searhResults.clear();
              controller.update();
            }
          },
          controller: textController,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            hintText: 'কীসের উপর সার্চ করতে চান?',
            hintStyle: TextStyle(
              color: controller.isDarkMode ? Colors.white38 : Colors.black38,
              fontSize: 15,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: textController.text.isEmpty
                ? null
                : IconButton(
                    onPressed: () {
                      textController.clear();
                      postController.searhResults.clear();
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
