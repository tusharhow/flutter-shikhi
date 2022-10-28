import 'package:flutter/material.dart';

class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ভূমিকা',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World App'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
