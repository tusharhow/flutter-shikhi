import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class BigScreenDetailsPage extends StatelessWidget {
  const BigScreenDetailsPage({Key? key, required this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    final formatDate = DateFormat('dd-MM-yyyy : hh-mm').format(DateTime.now());
    BlogController controller = Get.put(BlogController());
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title'] ?? 'Flutter Shikhi',
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
                  child: Image.asset(
                    data['image1'],
                    height: 400,
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
                data['title'] ?? '',
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
                  data['desc1'] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'GolestaBorno',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                data['image2'],
                height: 300,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  data['desc2'] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'GolestaBorno',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                data['image3'],
                height: 300,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  data['desc3'] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'GolestaBorno',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                data['image4'],
                height: 300,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  data['desc4'] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'GolestaBorno',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  data['desc5'] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'GolestaBorno',
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => BigScreenDetailsPage(
                                    data: controller.relatedPosts[index])));
                      },
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                controller.relatedPosts[index]['image1'],
                                height: 100,
                                width: 100,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.relatedPosts[index]['title'],
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
                                      controller.relatedPosts[index]['desc1'],
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
  }
}
