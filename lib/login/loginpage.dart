import 'package:artplatform/api/kakao_api/kakaoformdata.dart';
import 'package:artplatform/api/user_api/user_apidata.dart';
import 'package:artplatform/login/testuserselect.dart';
import 'package:artplatform/widgets/login/kakaologin.dart';
import 'package:artplatform/widgets/login/logoutbutton.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  final storage = FlutterSecureStorage();

  // final formKey = GlobalKey<FormState>();

  // KakaoFormData formData = KakaoFormData();

  Future<void> btnTap() async {
    print('start');
    final String token = await getKakaoToken();
    print(token);
    final res = await UserApiData.kakaoLogin(token);
    res.id;
    res.name;
    res.profile;
    res.type;
    print(res.id);
    print(res.name);
    print(res.profile);
    print(res.type);
    storage.write(key: 'id', value: res.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/loginimage.png') // 배경 이미지
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
                  onPressed: () {
                    btnTap();
                  },
                  child: Image.asset("assets/images/kakao_login.png",
                      fit: BoxFit.cover),
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     await Logout();
                //     setState(() {});
                //   },
                //   child: Text('Logout'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
