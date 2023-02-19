import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:flutter_shikhi/app/data/codes/theme_code.dart';
import 'package:flutter_shikhi/app/models/post_model.dart';
import 'package:flutter_shikhi/app/responsive.dart';
import 'package:flutter_shikhi/app/screens/devices/homepage.dart';
import 'package:flutter_shikhi/app/screens/devices/tablet_view.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../components/footer_widget.dart';
import '../../components/top_header_widget.dart';
import '../../data/data.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<BlogController>(
            init: BlogController(),
            builder: (controller) {
              final postController = Get.put(PostController());
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 200),
                    child: Column(
                      children: [
                        TopHeaderDesktop(controller: controller),
                        const SizedBox(height: 50),
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
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'ডেভেলপারদের জন্য মাতৃভাষা বাংলায় ফ্লাটারের \n সবচেয়ে বড় টিউটোরিয়াল ভান্ডার',
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'Borno',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Card(
                            elevation: 5,
                            child: SizedBox(
                              height: 55,
                              width: MediaQuery.of(context).size.width / 3,
                              child: TextFormField(
                                style: TextStyle(
                                    color: controller.isDarkMode
                                        ? Colors.white
                                        : Colors.black45),
                                onChanged: (String query) {
                                  if (query.isNotEmpty) {
                                    postController
                                        .onSearchTextChanged(query.trim());
                                    controller.update();
                                  } else {
                                    postController.searhResults.clear();
                                    controller.update();
                                  }
                                },
                                controller: postController.searchQuery,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 16),
                                  hintText: 'কীসের উপর সার্চ করতে চান?',
                                  hintStyle: TextStyle(
                                    color: controller.isDarkMode
                                        ? Colors.white54
                                        : Colors.black45,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  suffixIcon: postController
                                          .searchQuery.text.isEmpty
                                      ? null
                                      : IconButton(
                                          onPressed: () {
                                            postController.searchQuery.clear();
                                            postController.searhResults.clear();
                                            controller.update();
                                          },
                                          icon: Icon(Icons.clear,
                                              color: controller.isDarkMode
                                                  ? Colors.white
                                                  : Colors.black45),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 80),
                        postController.searhResults.isNotEmpty
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
                                              postController.searhResults
                                                  .length, (index) {
                                            final topic = postController
                                                .searhResults[index];
                                            return ListTile(
                                              title: Text(topic.title,
                                                  style: const TextStyle(
                                                    fontSize: 22,
                                                    fontFamily: 'Borno',
                                                  )),
                                              leading: const Icon(
                                                Icons.search,
                                                color: Colors.blue,
                                                size: 40,
                                              ),
                                              subtitle: Text(topic.subtitle,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'Borno',
                                                    color: controller.isDarkMode
                                                        ? Colors.white54
                                                        : Colors.black45,
                                                  )),
                                              onTap: () {
                                                context
                                                    .push('/${topic.subtitle}');
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
                            : FutureBuilder<List<PostModel>>(
                                future: postController.fetchPosts(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 3.5,
                                      ),
                                      itemBuilder: (context, index) {
                                        final topic = snapshot.data![index];
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            elevation: 1,
                                            child: ListTile(
                                              title: Center(
                                                child: Text(
                                                  topic.title,
                                                  style: TextStyle(
                                                    fontSize: 20,
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
                                                context
                                                    .push('/${topic.subtitle}');
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                  const FooterWidget(),
                ],
              );
            }),
      ),
    );
  }
}
