class UserModel {
  final String id, name, type;

  UserModel.fromjson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'],
        type = json['type'];
}

// class UserId {
//   int? id;


//   UserId ({
//     this.id
//   });
// }
