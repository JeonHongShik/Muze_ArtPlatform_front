class UserModel {
  final String id, name, profile, type;

  UserModel.fromjson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'],
        profile = json['profile'],
        type = json['type'];
        
}

// class UserId {
//   int? id;


//   UserId ({
//     this.id
//   });
// }
