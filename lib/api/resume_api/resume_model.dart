class ResumeModel {
  final int age, call;
  final String education, career, award, introduce, gender, profile;

  ResumeModel.fromjson(Map<String, dynamic> json)
      : call = json['call'],
        age = json['age'],
        education = json['education'],
        career = json['career'],
        award = json['award'],
        introduce = json['introduce'],
        profile = json['profile'],
        gender = json['gender'];
}

class ResumeFormData {
  String? call, age, education, career, award, introduce, profile, gender;

  ResumeFormData({
    this.call,
    this.age,
    this.education,
    this.career,
    this.award,
    this.introduce,
    this.profile,
    this.gender,
  });

  Map<String, dynamic> toJson() => {
        'call': call,
        'age': age,
        'education': education,
        'career': career,
        'award': award,
        'introduce': introduce,
        'profile': profile,
        'gender': gender,
      };
}
