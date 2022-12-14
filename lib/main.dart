import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/responsive.dart';
import 'package:flutter_shikhi/app/screens/devices/desktop_view.dart';
import 'package:flutter_shikhi/app/screens/devices/tablet_view.dart';
import 'package:flutter_shikhi/firebase_options.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/screens/devices/homepage.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    bool isDarkMode = storage.read('isDarkMode') ?? false;
    return GetMaterialApp(
      title: 'ফ্লাটার শিখি',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode
          ? ThemeData.dark(
              useMaterial3: true,
            )
          : ThemeData.light(
              useMaterial3: true,
            ),
      home: const Responsive(
        mobile: MyHomePage(),
        tablet: TabletView(),
        desktop: DesktopView(),
      ),
    );
  }
}
