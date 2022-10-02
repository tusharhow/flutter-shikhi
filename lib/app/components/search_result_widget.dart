import 'package:flutter/material.dart';

import '../controllers/search_controller.dart';
import '../screens/details_page.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    Key? key, required this.controller,
  }) : super(key: key);
final SearchController controller ;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.searchResult.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    data: controller.searchResult[index],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16),
              child: Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    controller.searchResult[index]
                            ['title'] ??
                        '',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
  }
}

