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
    SearchController controller = Get.put(SearchController());
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title'] ?? 'Flutter Shikhi',
            style: const TextStyle(
              fontFamily: 'Borno',
            )),
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
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/icons/load.png',
                    placeholderCacheHeight: 300,
                    placeholderCacheWidth: 300,
                    placeholderFit: BoxFit.cover,
                    placeholderScale: 0.5,
                    image: data['image1'],
                    height: 400,
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
              FadeInImage.assetNetwork(
                placeholder: 'assets/icons/load.png',
                image: data['image2'],
                height: 300,
                fadeInCurve: Curves.easeIn,
                fadeInDuration: const Duration(seconds: 1),
                fadeOutCurve: Curves.easeOut,
                fadeOutDuration: const Duration(seconds: 1),
                imageErrorBuilder: (context, error, stackTrace) => const Center(
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
              FadeInImage.assetNetwork(
                placeholder: 'assets/icons/load.png',
                image: data['image3'],
                height: 300,
                fadeInCurve: Curves.easeIn,
                fadeInDuration: const Duration(seconds: 1),
                fadeOutCurve: Curves.easeOut,
                fadeOutDuration: const Duration(seconds: 1),
                imageErrorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 35,
                  ),
                ),
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
              FadeInImage.assetNetwork(
                placeholder: 'assets/icons/load.png',
                image: data['image4'],
                height: 300,
                fadeInCurve: Curves.easeIn,
                fadeInDuration: const Duration(seconds: 1),
                fadeOutCurve: Curves.easeOut,
                fadeOutDuration: const Duration(seconds: 1),
                imageErrorBuilder: (context, error, stackTrace) => const Center(
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
            ],
          ),
        ),
      ),
    );
  }
}
