import 'dart:io';

class ResumeModel {
  final String author,
      education,
      award,
      career,
      introduce,
      call,
      profile; //profile은 File 형식
  final int id, age;

  ResumeModel.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        author = json['author'],
        age = json['age'],
        education = json['education'],
        award = json['award'],
        career = json['career'],
        introduce = json['introduce'],
        call = json['call'],
        profile = json['profile'];
}

class ResumeFormData {
  String? author,
      education,
      award,
      career,
      introduce,
      call,
      profile; //profile은 File 형식
  int? id, age;

  ResumeFormData({
    this.author,
    this.education,
    this.award,
    this.career,
    this.introduce,
    this.age,
    this.id,
    this.call,
    this.profile,
  });

  Map<String, dynamic> toJson() => {
        'author': author,
        'education': education,
        'award': award,
        'career': career,
        'introduce': introduce,
        'call': call,
        'age': age,
        'id': id,
        'profile': profile,
      };
}
