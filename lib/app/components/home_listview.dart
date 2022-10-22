import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import '../screens/details_page.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: topicData.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final topic = topicData[index];

          return ListTile(
            title: Text(
              topic['title'],
              style: const TextStyle(
                fontFamily: 'Borno',
                fontSize: 20,
              ),
            ),
            leading: const Icon(
              Icons.widgets,
              color: Colors.blue,
            ),
            subtitle: Text(
              topic['subtitle'],
              style: const TextStyle(
                fontFamily: 'GolestaBorno',
                fontSize: 16,
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
  }
}
