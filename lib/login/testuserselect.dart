import 'package:artplatform/pagelayout/cunsumer/cunsumermain.dart';
import 'package:artplatform/pagelayout/major/majormainpage.dart';

import 'package:flutter/material.dart';

enum Usertype { Major, Consumer }

class TestUserSelect extends StatefulWidget {
  const TestUserSelect({Key? key}) : super(key: key);

  @override
  State<TestUserSelect> createState() => _TestUserSelectState();
}

class _TestUserSelectState extends State<TestUserSelect> {
//처음에는 전공자가 선택되어 있도록 Major로 초기화 -> groupValue에 들어갈 값!
  Usertype? _usertype = Usertype.Major;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: const Text('전공자'),
              leading: Radio<Usertype>(
                fillColor:
                    MaterialStateColor.resolveWith((states) => Colors.black),
                value: Usertype.Major,
                groupValue: _usertype,
                onChanged: (Usertype? value) {
                  setState(() {
                    _usertype = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('소비자'),
              leading: Radio<Usertype>(
                value: Usertype.Consumer,
                groupValue: _usertype,
                onChanged: (Usertype? value) {
                  setState(() {
                    _usertype = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text('선택 : $_usertype'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 255, 197, 197),
        onPressed: () {
          if (_usertype == Usertype.Major) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ConsumerMainPage(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MajorMainPage(),
              ),
            );
          }
        },
        child: Icon(
          Icons.arrow_forward,
        ),
      ),
    );
  }
}
