import 'package:artplatform/api/kakao_api/kakaoformdata.dart';
import 'package:artplatform/widgets/logout.dart';
import 'package:flutter/material.dart';
import '../../widgets/kakao_login.dart';
import 'package:http/http.dart' as http;

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _loginState();
}

class _loginState extends State<Loginpage> {
  final kakaologin = Kakao_Login();
  final formKey = GlobalKey<FormState>();
  KakaoFormData formData = KakaoFormData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/loginimage.png'), // 배경 이미지
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent, // 배경색을 투명으로 설정
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 550,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(183, 45),
                      backgroundColor: Colors.transparent,
                      elevation: 0.0),
                  onPressed: () async {
                    final String token = await kakaologin.login();
                    print(token);
                    final response = await http.post(
                      Uri.parse('http://192.168.0.2:8000/account/kakaologin/'),
                      body: {"accessToken": token},
                    );
                    print("statuscode : " + response.statusCode.toString());
                  },
                  child: Image.asset(
                    "images/kakao_login.png",
                    fit: BoxFit.cover,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Logout();
                    setState(() {});
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
