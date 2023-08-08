import 'package:artplatform/api/user_api/user_apidata.dart';
import 'package:artplatform/providers/currentUser.dart';
import 'package:artplatform/widgets/login/kakaologin.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  final storage = FlutterSecureStorage();
  late CurrentUserProvider _currentUserProvider;

  // final formKey = GlobalKey<FormState>();

  // KakaoFormData formData = KakaoFormData();

  Future<void> btnTap() async {
    print('start');
    final String token = await getKakaoToken();
    print(token);
    final res = await UserApiData.kakaoLogin(token);
    res.id;
    _currentUserProvider.getUser(res.id);
    storage.write(key: 'id', value: res.id);
    _currentUserProvider.setLogin('logged');
  }

  @override
  Widget build(BuildContext context) {
    _currentUserProvider =
        Provider.of<CurrentUserProvider>(context, listen: false);
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
                  onPressed: () async {
                    await btnTap();
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
