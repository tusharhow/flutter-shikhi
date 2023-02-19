import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/search_controller.dart';

class TopHeaderDesktop extends StatelessWidget {
  const TopHeaderDesktop({Key? key, required this.controller})
      : super(key: key);
  final BlogController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 100, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 140,
                decoration: BoxDecoration(
                  color: controller.isDarkMode ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    'ফ্লাটার শিখি',
                    style: TextStyle(
                      fontSize: 27,
                      color:
                          controller.isDarkMode ? Colors.black : Colors.white,
                      fontFamily: 'Borno',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  launchUrl(
                      Uri.parse('https://github.com/tusharhow/flutter-shikhi'));
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
                            onPressed: () => controller.toggleDarkMode())),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
