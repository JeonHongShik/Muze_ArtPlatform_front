import 'dart:async';
import 'dart:convert';

import 'package:artplatform/api/kakao_api/kakaoformdata.dart';
import 'package:http/http.dart' as http;

class KakaoApiData {
  static const String baseUrl = "http://10.0.2.2:8000";
  static const String kakao = "account/user";

  static Future<List<KakaoModel>> getKakao() async {
    List<KakaoModel> kakaoInstances = [];
    final url = Uri.parse('$baseUrl/$kakao');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> kakaos =
          jsonDecode((utf8.decode(response.bodyBytes)));
      for (var kakao in kakaos) {
        final instance = KakaoModel.fromjson(kakao);
        kakaoInstances.add(instance);
      }
      return kakaoInstances;
    }
    throw Error();
  }
}
