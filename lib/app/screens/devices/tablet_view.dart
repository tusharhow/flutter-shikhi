import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:get/get.dart';
import '../../data/data.dart';
import '../desktop_details_page.dart';

class TabletView extends StatelessWidget {
  const TabletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<SearchController>(
            init: SearchController(),
            builder: (controller) {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 0, right: 100, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const TabletView()),
                                    (route) => false);
                              },
                              child: Image.asset(
                                'assets/logos/logo.png',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text('Home',
                                    style: TextStyle(fontSize: 23))),
                            const SizedBox(width: 20),
                            TextButton(
                                onPressed: () {
                                 
                                },
                                child: const Text('About',
                                    style: TextStyle(fontSize: 23))),
                            const SizedBox(width: 20),
                            TextButton(
                                onPressed: () {
                                  
                                },
                                child: const Text('Contact',
                                    style: TextStyle(fontSize: 23))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Flutter Shikhi',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Flutter Shikhi is a website where you can learn flutter',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 5,
                      child: SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black45),
                          onChanged: (String query) {
                            if (query.isNotEmpty) {
                              controller.searchPost(query);
                              controller.update();
                            } else {
                              controller.searchResult.clear();
                              controller.update();
                            }
                          },
                          controller: controller.searchQuery,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            hintText: 'Search a topic',
                            hintStyle: const TextStyle(color: Colors.black38),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            suffixIcon: controller.searchQuery.text.isEmpty
                                ? null
                                : IconButton(
                                    onPressed: () {
                                      controller.searchQuery.clear();
                                      controller.searchResult.clear();
                                      controller.update();
                                    },
                                    icon: const Icon(Icons.clear,
                                        color: Colors.black38),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  CustomScrollView(
                    primary: false,
                    shrinkWrap: true,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: const EdgeInsets.all(20.0),
                        sliver: SliverGrid.count(
                          childAspectRatio: 4.0,
                          crossAxisCount: 2,
                          children: List.generate(topicData.length, (index) {
                            final topic = topicData[index];
                            return ListTile(
                              title: Text(topic['title'],
                                  style: const TextStyle(fontSize: 20)),
                              leading: const Icon(
                                Icons.widgets,
                                color: Colors.blue,
                                size: 40,
                              ),
                              subtitle: Text(topic['subtitle'],
                                  style: const TextStyle(fontSize: 15)),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => BigScreenDetailsPage(
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
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
