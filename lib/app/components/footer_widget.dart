import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // footer design
          const SizedBox(height: 20),
          const Text(
            'আমাদের সাথেই থাকুন',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Borno',
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),
          const Text(
            'ফ্লাটার শিখি একটি ফ্রি ওপেন সোর্স প্রোজেক্ট। আমরা এই প্রোজেক্টে\nফ্লাটার এর সব বিষয় শিখব। আমাদের সাথে থাকুন।',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Borno',
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              text: 'আমাকে খুজুন এখানে ',
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Borno',
                color: Colors.white,
              ),
              children: [
                const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(FontAwesomeIcons.github,
                      size: 16, color: Colors.white),
                ),
                TextSpan(
                  text: ' ফ্লাটার শিখি গিটহাব',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Borno',
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      const url = 'https://github.com/tusharhow/flutter-shikhi';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('Copyright © 2022 Flutter Shikhi',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Borno',
                color: Colors.white,
              )),
          const SizedBox(height: 10),

          Text.rich(
            TextSpan(
              text: 'Developed by ',
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Borno',
                color: Colors.white,
              ),
              children: [
                TextSpan(
                    text: 'Tushar Mahmud',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Borno',
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => launchUrl(
                          Uri.parse('https://www.facebook.com/tusharhow'))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
