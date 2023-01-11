import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';
import '../data/data.dart';
import '../models/post_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.post}) : super(key: key);
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    final formatedDate =
        DateFormat('dd-MM-yyyy : hh-mm').format(DateTime.now());
    return GetBuilder<BlogController>(
        init: BlogController(),
        builder: (controller) {
          PostController postController = Get.put(PostController());
          return Scaffold(
            appBar: AppBar(
              title: Text(
                post.title,
                style: const TextStyle(
                  fontFamily: 'Borno',
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    post.image1 == ""
                        ? Center(
                            child: Image.asset(
                            "assets/images/flutter.png",
                            height: 300,
                          ))
                        : Center(
                            child: Image.asset(
                              post.image1,
                              height: 300,
                            ),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.remove_red_eye,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GetBuilder<PostController>(
                          init: PostController(),
                          initState: (_) {},
                          builder: (_) {
                            return Text(
                              _.postViewCount.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(formatedDate.toString(),
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
                    SelectableText(
                      post.desc1,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Borno',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    post.image1 == ""
                        ? Image.asset(
                            "assets/images/flutter.png",
                            height: 200,
                          )
                        : Image.asset(
                            post.image1,
                            height: 200,
                          ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      post.desc2,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Borno',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    post.image2 == ""
                        ? Image.asset(
                            "assets/images/flutter.png",
                            height: 200,
                          )
                        : Image.asset(
                            post.image2,
                            height: 200,
                          ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      post.desc3,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Borno',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    post.image3 == ""
                        ? Image.asset(
                            "assets/images/flutter.png",
                            height: 200,
                          )
                        : Image.asset(
                            post.image3,
                            height: 200,
                          ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      post.desc4,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Borno',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    post.image4 == ""
                        ? Image.asset(
                            "assets/images/flutter.png",
                            height: 200,
                          )
                        : Image.asset(
                            post.image4,
                            height: 200,
                          ),
                    const SizedBox(
                      height: 16,
                    ),
                    post.desc5 != ""
                        ? const SizedBox(
                            height: 16,
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      post.desc5,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Borno',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    post.image5 == ""
                        ? Image.asset(
                            "assets/images/flutter.png",
                            height: 200,
                          )
                        : Image.asset(
                            post.image5,
                            height: 200,
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 600,
                      width: double.infinity,
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
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                reverse: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  final post = snapshot.data![index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                DetailsPage(post: post)),
                                      );
                                    },
                                    child: Card(
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
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
        });
  }
}
