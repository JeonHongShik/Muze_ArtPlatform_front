class UserModel {
  final String id, name, profile, type;

  UserModel.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        profile = json['profile'],
        type = json['type'];
        
}
