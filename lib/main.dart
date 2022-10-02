import 'package:flutter/material.dart';
import 'package:flutter_shikhi/app/responsive.dart';
import 'package:flutter_shikhi/app/screens/devices/desktop_view.dart';
import 'package:flutter_shikhi/app/screens/devices/tablet_view.dart';
import 'package:get/get.dart';
import 'app/screens/devices/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Shikhi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
