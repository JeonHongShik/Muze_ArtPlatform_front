class TestModel {
  final String profile;

  TestModel.fromjson(Map<String, dynamic> json) : profile = json['profile'];
}
