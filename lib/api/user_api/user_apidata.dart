import 'dart:convert';

import 'package:artplatform/api/user_api/user_model.dart';
import 'package:http/http.dart' as http;

class UserApiData {
  static const String baseUrl =
      "http://ec2-3-39-25-227.ap-northeast-2.compute.amazonaws.com/"; //내가 서버를 열고 내가 부르려면 10.0.2.2를 써야 함

  static Future<UserModel> kakaoLogin(String accessToken) async {
    const String user = "account/kakaologin/";
    final url = Uri.parse('$baseUrl/$user');
    final response = await http.post(url, body: {'accessToken': accessToken});
    if (response.statusCode == 200 || response.statusCode == 201) {
      final user = jsonDecode(utf8.decode(response.bodyBytes));
      UserModel instance = UserModel.fromjson(user);
      return instance;
    }
    throw Error();
  }

  static Future<UserModel> getcurrentUser(String id) async {
    String user = "account/user/?id=$id";
    final url = Uri.parse('$baseUrl/$user');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final user = jsonDecode(utf8.decode(response.bodyBytes));
      UserModel instance = UserModel.fromjson(user);
      return instance;
    }
    throw Error();
  }
}
