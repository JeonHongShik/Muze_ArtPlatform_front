class ConsumerFormData {
  String? name, education, awards, careers, introduce, kind;
  int? age, id;

  ConsumerFormData({ //현재 요소는 resume 공고게시물 요소로 수정 예정
    this.name,
    this.education,
    this.awards,
    this.careers,
    this.introduce,
    this.kind,
    this.age,
    this.id,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'education': education,
        'awards': awards,
        'careers': careers,
        'introduce': introduce,
        'kind': kind,
        'age': age,
        'id': id
      };
}
