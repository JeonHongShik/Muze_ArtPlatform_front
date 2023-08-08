import 'package:artplatform/login/loginpage.dart';
import 'package:artplatform/pagelayout/major/majormainpage.dart';
import 'package:artplatform/providers/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

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
    _currentUserProvider =
        Provider.of<CurrentUserProvider>(context, listen: true);
    switch (_currentUserProvider.logged) {
      case "":
        return Loginpage();

      case "logged":
        return MajorMainPage(); //타입에 따라 페이지 띄워주게 수정해야 함

      default:
        return Center(child: CircularProgressIndicator());
    }
  }
}
