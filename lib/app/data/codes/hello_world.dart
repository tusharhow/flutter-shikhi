import 'package:flutter/material.dart';


class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Hello World App',
     home: Scaffold(
     appBar: AppBar(
       title: Text('Hello World App'),
     ),
      body: Center(
       child: Text('Hello World'),
     ),
    ),
   );
  }
}