import 'dart:io';

import 'package:artplatform/providers/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

import 'login/status.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36';
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
      nativeAppKey: '62aa2f65099eaaf2f9f5ea6c5ca60a36',
      javaScriptAppKey: 'ba7d37a30b8d2b926672d933e4b45e39');

  // print(await KakaoSdk.origin); 해시 키 추출

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUserProvider(),
      child: MaterialApp(home: Status()),
    );
  }
}

// MaterialApp(
//      home: Status(),