import 'package:artplatform/screens/tryLoginpage.dart';
import 'package:artplatform/widgets/kakao_login.dart';
import 'package:artplatform/widgets/view_model.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '62aa2f65099eaaf2f9f5ea6c5ca60a36');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final viewModel = ViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const tryLoginpage(),
    );
  }
}
