import 'dart:convert';

import 'package:artplatform/api/resume_api/resume_model.dart';
import 'package:http/http.dart' as http;

class ApiData {
  static const String baseUrl =
      "http://10.0.2.2:8000"; //내가 서버를 열고 내가 부르려면 10.0.2.2를 써야 함
  static const String resume = "resume/?format=json";

  static Future<List<ResumeModel>> getResume() async {
    List<ResumeModel> resumeInstances = [];
    final url = Uri.parse('$baseUrl/$resume');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> resumes = jsonDecode(utf8.decode(response.bodyBytes));
      for (var resume in resumes) {
        final instance = ResumeModel.fromjson(resume);
        resumeInstances.add(instance);
      }

      return resumeInstances;
    }
    throw Error();
  }
}
