import 'package:flutter/material.dart';
import '../data/images.dart';
import 'details_page.dart';

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
          child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: topicData.length,
              itemBuilder: (context, index) {
                final topic = topicData[index];

                return ListTile(
                  title: Text(topic['title']),
                  leading: const Icon(
                    Icons.widgets,
                    color: Colors.blue,
                  ),
                  subtitle: Text(topic['subtitle']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
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
              }),
        ],
      )),
    );
  }
}
