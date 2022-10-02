import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:get/get.dart';
import '../../data/data.dart';
import '../desktop_details_page.dart';


class DesktopView extends StatelessWidget {
  const DesktopView({Key? key}) : super(key: key);

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
                              onTap: () {},
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
                            GestureDetector(
                              onTap: () {
                               
                              },
                              child: Row(
                                children: const [
                                  Icon(Icons.star_border_rounded),
                                  SizedBox(width: 5),
                                  Text(
                                    'স্টার দিন',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
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
                        children: const [
                          Text(
                            'ফ্লাটার শিখি',
                            style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'ফ্লাটার শিখির মাধ্যমে আপনি বাংলায় ফ্লাটার এর সব বিষয় শিখতে পারবেন।',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'আপনি ফ্লাটার শিখি এ আপনার প্রশ্ন করতে পারবেন।',
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
                        width: MediaQuery.of(context).size.width / 3,
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
                  const SizedBox(height: 80),
                  controller.searchResult.isNotEmpty
                      ? CustomScrollView(
                          primary: false,
                          shrinkWrap: true,
                          slivers: [
                            SliverPadding(
                              padding: const EdgeInsets.all(16.0),
                              sliver: SliverGrid.count(
                                childAspectRatio: 4.0,
                                crossAxisCount: 3,
                                children: List.generate(
                                    controller.searchResult.length, (index) {
                                  final topic = controller.searchResult[index];
                                  return ListTile(
                                    title: Text(topic['title'],
                                        style: const TextStyle(fontSize: 20)),
                                    leading: const Icon(
                                      Icons.search,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                    subtitle: Text(topic['subtitle'],
                                        style: const TextStyle(fontSize: 15)),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              BigScreenDetailsPage(
                                            data: topic,
                                          ),
                                        ),
                                      );
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        )
                      : CustomScrollView(
                          primary: false,
                          shrinkWrap: true,
                          slivers: <Widget>[
                            SliverPadding(
                              padding: const EdgeInsets.all(20.0),
                              sliver: SliverGrid.count(
                                childAspectRatio: 4.0,
                                crossAxisCount: 3,
                                children:
                                    List.generate(topicData.length, (index) {
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
                                          builder: (context) =>
                                              BigScreenDetailsPage(
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
