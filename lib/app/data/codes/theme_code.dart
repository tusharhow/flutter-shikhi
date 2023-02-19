import 'package:flutter/material.dart';

class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'থিম',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
        fontFamily: 'Georgia',

        //text styling
        textTheme:const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrangeAccent),
      ),
      home: const ThemeAppCode(),
    );
  }
}

class ThemeAppCode extends StatelessWidget {
  const ThemeAppCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Hello Coder!',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
              Theme.of(context).colorScheme.copyWith(secondary: Colors.red),
        ),
        child: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.arrow_circle_up),
        ),
      ),
    );
  }
}
