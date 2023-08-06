class KakaoModel {
  final int id;
  final String name, profile;

  KakaoModel.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        profile = json['profile'];
}

class KakaoFormData {
  int? id;
  String? name, profile;

  KakaoFormData({
    this.id,
    this.name,
    this.profile,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'profile': profile,
      };
}
