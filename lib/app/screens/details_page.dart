import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    final formatDate = DateFormat('dd-MM-yyyy : hh-mm').format(DateTime.now());
    return GetBuilder<BlogController>(
        init: BlogController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                data['title'] ?? 'Flutter Shikhi',
                style: const TextStyle(
                  fontFamily: 'GolestaBorno',
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
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
                    Center(
                      child: Image.asset(
                        data['image1'],
                        height: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                    SelectableText(
                      data['desc1'] ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'GolestaBorno',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      data['image1'],
                      height: 200,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      data['desc2'] ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'GolestaBorno',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      data['image2'],
                      height: 200,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      data['desc3'] ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'GolestaBorno',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      data['image3'],
                      height: 200,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      data['desc4'] ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'GolestaBorno',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      data['image4'],
                      height: 200,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    data['desc5'] != ""
                        ? const SizedBox(
                            height: 16,
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      data['desc5'] ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'GolestaBorno',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      data['image5'],
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
                        sourceFilePath: data['code'],
                        child: data['preview'],
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
                          fontFamily: 'GolestaBorno',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    controller.relatedPosts.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.relatedPosts.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => DetailsPage(
                                                data: controller
                                                    .relatedPosts[index])));
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            controller.relatedPosts[index]
                                                ['image1'],
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
                                                  controller.relatedPosts[index]
                                                      ['title'],
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'GolestaBorno',
                                                  ),
                                                  maxLines: 1,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  controller.relatedPosts[index]
                                                      ['desc1'],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'GolestaBorno',
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
                          ),
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
