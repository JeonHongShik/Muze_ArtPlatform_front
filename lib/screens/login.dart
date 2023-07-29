import 'package:artplatform/widgets/circularbutton.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const SizedBox(
                height: 120,
                width: 125,
                child: CircularButton(
                  text: '전공자',
                  bgColor: Color.fromARGB(255, 255, 84, 84),
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 120,
                width: 125,
                child: CircularButton(
                  text: '소비자',
                  bgColor: Color.fromARGB(255, 253, 205, 205),
                  textColor: Color.fromARGB(255, 255, 84, 84),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(183, 45),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0),
                onPressed: () {},
                child: Image.asset(
                  "images/kakao_login.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
