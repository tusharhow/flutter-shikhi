import 'package:cached_network_image/cached_network_image.dart';
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
                  child: CachedNetworkImage(
                    imageUrl: data['image1'],
                    height: 400,
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: Color(0xFF2c3e50),
                    )),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
              CachedNetworkImage(
                imageUrl: data['image2'],
                height: 300,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: Color(0xFF2c3e50),
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
              CachedNetworkImage(
                imageUrl: data['image3'],
                height: 300,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: Color(0xFF2c3e50),
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
              CachedNetworkImage(
                imageUrl: data['image4'],
                height: 300,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: Color(0xFF2c3e50),
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
