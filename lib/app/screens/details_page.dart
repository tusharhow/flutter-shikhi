import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/controllers/search_controller.dart';
import 'package:get/get.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                data['title'] ?? 'Flutter Shikhi',
                style: const TextStyle(
                  fontFamily: 'GolestaBorno',
                ),
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
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/icons/load.png',
                      image: data['image1'],
                      height: 200,
                      fadeInCurve: Curves.easeIn,
                      fadeInDuration: const Duration(seconds: 1),
                      fadeOutCurve: Curves.easeOut,
                      fadeOutDuration: const Duration(seconds: 1),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          const Center(
                        child: Icon(
                          Icons.error,
                          size: 35,
                          color: Colors.red,
                        ),
                      ),
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
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/icons/load.png',
                      image: data['image2'],
                      height: 200,
                      fadeInCurve: Curves.easeIn,
                      fadeInDuration: const Duration(seconds: 1),
                      fadeOutCurve: Curves.easeOut,
                      fadeOutDuration: const Duration(seconds: 1),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          const Center(
                        child: Icon(
                          Icons.error,
                          size: 35,
                          color: Colors.red,
                        ),
                      ),
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
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/icons/load.png',
                      image: data['image3'],
                      height: 200,
                      fadeInCurve: Curves.easeIn,
                      fadeInDuration: const Duration(seconds: 1),
                      fadeOutCurve: Curves.easeOut,
                      fadeOutDuration: const Duration(seconds: 1),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          const Center(
                        child: Icon(
                          Icons.error,
                          size: 35,
                          color: Colors.red,
                        ),
                      ),
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
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/icons/load.png',
                      image: data['image4'],
                      height: 200,
                      fadeInCurve: Curves.easeIn,
                      fadeInDuration: const Duration(seconds: 1),
                      fadeOutCurve: Curves.easeOut,
                      fadeOutDuration: const Duration(seconds: 1),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          const Center(
                        child: Icon(
                          Icons.error,
                          size: 35,
                          color: Colors.red,
                        ),
                      ),
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
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/icons/load.png',
                      image: data['image5'],
                      height: 200,
                      fadeInCurve: Curves.easeIn,
                      fadeInDuration: const Duration(seconds: 1),
                      fadeOutCurve: Curves.easeOut,
                      fadeOutDuration: const Duration(seconds: 1),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          const Center(
                        child: Icon(
                          Icons.error,
                          size: 35,
                          color: Colors.red,
                        ),
                      ),
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
                  ],
                ),
              ),
            ),
          );
        });
  }
}
