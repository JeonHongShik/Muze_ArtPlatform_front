//consumer 주소로 바꿔야 함

import 'dart:convert';

import 'package:artplatform/api/consumer_api/consumer_model.dart';
import 'package:http/http.dart' as http;

class ConsumerApiData {
  static const String baseUrl =
      "http://ec2-3-39-25-227.ap-northeast-2.compute.amazonaws.com/"; //내가 서버를 열고 내가 부르려면 10.0.2.2를 써야 함
  static const String consumer = "post/?format=json";

  static Future<List<ConsumerModel>> getConsumer() async {
    List<ConsumerModel> consumerInstances = [];
    final url = Uri.parse('$baseUrl/$consumer');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> consumers =
          jsonDecode(utf8.decode(response.bodyBytes));
      for (var consumer in consumers) {
        final instance = ConsumerModel.fromjson(consumer);
        consumerInstances.add(instance);
      }

      return consumerInstances;
    }
    throw Error();
  }
}
