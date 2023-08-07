class UserModel {
  final String id, name, type;

  UserModel.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        type = json['type'];
}
