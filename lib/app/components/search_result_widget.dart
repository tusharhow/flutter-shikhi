import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/data/data.dart';

import '../controllers/search_controller.dart';
import '../screens/details_page.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    Key? key,
    required this.controller,
    required this.postController,
  }) : super(key: key);
  final BlogController controller;
  final PostController postController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'সার্চ রেজাল্ট সমূহ',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Borno',
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: postController.searhResults.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      post: postController.searhResults[index],
                    ),
                  ),
                );
              },
              title: Text(
                postController.searhResults[index].title,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Borno',
                ),
              ),
              subtitle: Text(
                postController.searhResults[index].subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Borno',
                ),
              ),
              leading: Icon(
                Icons.search,
                color: controller.isDarkMode ? Colors.white : Colors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        ),
      ],
    );
  }
}
