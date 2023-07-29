class ResumeModel {
  final String name, education, awards, careers, introduce, kind;
  final int id, age;

  ResumeModel.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        age = json['age'],
        education = json['education'],
        awards = json['awards'],
        careers = json['careers'],
        introduce = json['introduce'],
        kind = json['kind'];
}
