import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:artplatform/widgets/login_platform.dart';

class Kakao_Loginpage extends StatefulWidget {
  const Kakao_Loginpage({super.key});

  @override
  State<Kakao_Loginpage> createState() => _Kakao_LoginpageState();
}

class _Kakao_LoginpageState extends State<Kakao_Loginpage> {
  LoginPlatform _loginPlatform = LoginPlatform.none;

  void signInWithKakao() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      final url = Uri.https('kapi.kakao.com', '/v2/user/me');

      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );

      final profileInfo = json.decode(response.body);
      print(profileInfo.toString());

      setState(() {
        _loginPlatform = LoginPlatform.kakao;
      });
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }

  void signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.kakao:
        await UserApi.instance.logout();
      case LoginPlatform.none:
        break;
    }

    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _loginPlatform != LoginPlatform.none
            ? _logoutButton()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _loginButton(
                    'kakao_logo',
                    signInWithKakao,
                  )
                ],
              ));
  }

  Widget _loginButton(String path, VoidCallback onTap) {
    return Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: Ink.image(
        image: AssetImage('images/kakao_login.png'),
        width: 183,
        height: 45,
        child: InkWell(
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff0165E1),
        ),
      ),
      child: const Text('로그아웃'),
    );
  }
}
