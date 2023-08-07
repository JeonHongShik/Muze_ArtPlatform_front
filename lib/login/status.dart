import 'package:artplatform/login/loginpage.dart';
import 'package:artplatform/pagelayout/major/majormainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class Status extends StatefulWidget {
  Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  final storage = FlutterSecureStorage();
  String? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
  }

  Future<void> getId() async {
    id = await storage.read(key: 'id');
  }

  @override
  Widget build(BuildContext context) {
    return (id != null) ? MajorMainPage() : Loginpage();
  }
}
