import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:get/get.dart';
import '../data/data.dart';
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
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<SearchController>(
              init: SearchController(),
              builder: (controller) {
                return Column(
                  children: [
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: 55,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black54),
                          onChanged: (String query) {
                            if (query.isNotEmpty) {
                              controller.searchPost(query);
                              print(controller.searchResult.length);
                              controller.update();
                            } else {
                              query = "";
                              controller.update();
                            }
                          },
                          controller: controller.searchQuery,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            hintText: 'Search a topic',
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.black38),
                            fillColor: Colors.black12,
                            filled: true,
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
                    const SizedBox(height: 20),
                    controller.searchResult.isNotEmpty
                        ? ListView.builder(
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
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: topicData.length,
                            physics: const NeverScrollableScrollPhysics(),
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
                                  print(topic['id']);
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
                            }),
                    const SizedBox(height: 16),
                  ],
                );
              })),
    );
  }
}
