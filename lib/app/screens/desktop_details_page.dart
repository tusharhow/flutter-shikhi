import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:flutter_shikhi/app/data/data.dart';
import 'package:flutter_shikhi/app/models/post_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class BigScreenDetailsPage extends StatelessWidget {
  const BigScreenDetailsPage({Key? key, required this.post}) : super(key: key);
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    final formatDate = DateFormat('dd-MM-yyyy : hh-mm').format(DateTime.now());
    BlogController controller = Get.put(BlogController());
    PostController postController = Get.put(PostController());
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title,
            style: const TextStyle(
              fontFamily: 'Borno',
            )),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: post.image1 == ""
                      ? Image.asset(
                          "assets/images/flutter.png",
                          height: 350,
                        )
                      : Image.asset(
                          post.image1,
                          height: 350,
                        ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(formatDate.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Borno',
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(
                'আজ ${controller.weekDayToBengali(DateFormat('EEEE').format(DateTime.now()))}',
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Borno',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Borno',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  post.desc1,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Borno',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                post.image2,
                height: 300,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  post.desc2,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Borno',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                post.image3,
                height: 300,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  post.desc3,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Borno',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                post.image4,
                height: 300,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  post.desc4,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Borno',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  post.desc5,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Borno',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 600,
                width: 700,
                child: WidgetWithCodeView(
                  codeLinkPrefix: "https://github.com/tusharhow",
                  syntaxHighlighterStyle: controller.isDarkMode
                      ? SyntaxHighlighterStyle.darkThemeStyle()
                      : SyntaxHighlighterStyle.lightThemeStyle(),
                  sourceFilePath: post.code,
                  child: post.preview,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Related Posts',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Borno',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<List<PostModel>>(
                  future: postController.fetchRandomOrderPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            final post = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            BigScreenDetailsPage(post: post)));
                              },
                              child: Card(
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        post.image1,
                                        height: 100,
                                        width: 100,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              post.title,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Borno',
                                              ),
                                              maxLines: 1,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              post.desc1,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Borno',
                                              ),
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
