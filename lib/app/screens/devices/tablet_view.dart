import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/data.dart';
import '../desktop_details_page.dart';

class TabletView extends StatelessWidget {
  const TabletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      const url = 'https://github.com/tusharhow/flutter-shikhi';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<BlogController>(
            init: BlogController(),
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
                            GestureDetector(
                              onTap: () {
                                _launchURL();
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star_border_rounded,
                                    color: controller.isDarkMode
                                        ? Colors.white60
                                        : Colors.black54,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Github',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: controller.isDarkMode
                                          ? Colors.white60
                                          : Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  GetBuilder<BlogController>(
                                      builder: (controller) => IconButton(
                                          icon: Icon(
                                            controller.isDarkMode
                                                ? Icons.dark_mode
                                                : Icons.light_mode,
                                            color: controller.isDarkMode
                                                ? Colors.white60
                                                : Colors.black54,
                                          ),
                                          onPressed: () =>
                                              controller.toggleDarkMode()))
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/logos/flutter.png',
                                height: 160,
                              ),
                              const SizedBox(width: 15),
                              Text(
                                'ফ্লাটার শিখি',
                                style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                  color: controller.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontFamily: 'Borno',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'ফ্লাটার শিখির মাধ্যমে আপনি বাংলায় ফ্লাটার এর সব বিষয় শিখতে পারবেন।',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Borno',
                              color: controller.isDarkMode
                                  ? Colors.white60
                                  : Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'আপনি ফ্লাটার শিখি এ আপনার প্রশ্ন করতে পারবেন।',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Borno',
                              color: controller.isDarkMode
                                  ? Colors.white60
                                  : Colors.black54,
                            ),
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
                          style: TextStyle(
                              color: controller.isDarkMode
                                  ? Colors.white54
                                  : Colors.black45),
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
                            hintText: 'কীসের উপর সার্চ করতে চান?',
                            hintStyle: TextStyle(
                                color: controller.isDarkMode
                                    ? Colors.white54
                                    : Colors.black38),
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
                                    icon: Icon(
                                      Icons.clear,
                                      color: controller.isDarkMode
                                          ? Colors.white54
                                          : Colors.black38,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  controller.searchResult.isNotEmpty
                      ? Column(
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
                            CustomScrollView(
                              primary: false,
                              shrinkWrap: true,
                              slivers: [
                                SliverPadding(
                                  padding: const EdgeInsets.all(16.0),
                                  sliver: SliverGrid.count(
                                    childAspectRatio: 4.0,
                                    crossAxisCount: 3,
                                    children: List.generate(
                                        controller.searchResult.length,
                                        (index) {
                                      final topic =
                                          controller.searchResult[index];
                                      return ListTile(
                                        title: Text(topic['title'],
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontFamily: 'Borno',
                                            )),
                                        leading: const Icon(
                                          Icons.search,
                                          color: Colors.blue,
                                          size: 40,
                                        ),
                                        subtitle: Text(topic['subtitle'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Borno',
                                              color: controller.isDarkMode
                                                  ? Colors.white54
                                                  : Colors.black45,
                                            )),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: topicData.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3.8,
                          ),
                          itemBuilder: (context, index) {
                            final topic = topicData[index];
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    topic['title'],
                                    style: TextStyle(
                                      fontSize: 23,
                                      fontFamily: 'Borno',
                                      fontWeight: FontWeight.bold,
                                      color: controller.isDarkMode
                                          ? Colors.white60
                                          : Colors.black54,
                                    ),
                                  ),
                                ),
                                hoverColor: controller.isDarkMode
                                    ? Colors.blue.shade300
                                    : Colors.blue.shade100,
                                tileColor: controller.isDarkMode
                                    ? Colors.black12
                                    : Colors.white,
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
                              ),
                            );
                          },
                        )
                ],
              );
            }),
      ),
    );
  }
}
