import 'dart:io';

import 'package:artplatform/pagelayout/cunsumer/cunsumermain.dart';
import 'package:flutter/material.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36';
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    // late final width = screenSize.width;
    // late final height = screenSize.height;

    // print(MediaQuery.of(context).size.width);

    return MaterialApp(
      home: SafeArea(
        child: ConsumerMainPage(),
      ),
    );
  }
}
