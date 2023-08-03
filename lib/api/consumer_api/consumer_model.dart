class ConsumerModel {
  final String author,
      title,
      info,
      type,
      deadline,
      date,
      location,
      intro,
      profile,
      call,
      pay;
  final int id;

  ConsumerModel.fromjson(Map<String, dynamic> json)
      : author = json['author'],
        id = json['id'],
        title = json['title'],
        info = json['info'],
        type = json['type'],
        deadline = json['deadline'],
        date = json['date'],
        location = json['location'],
        intro = json['intro'],
        call = json['call'],
        profile = json['profile'],
        pay = json['pay'];
}

class ConsumerFormData {
  String? author,
      title,
      info,
      type,
      deadline,
      date,
      location,
      intro,
      call,
      pay,
      profile;
  int? id;

  ConsumerFormData(
      {this.author,
      this.id,
      this.title,
      this.info,
      this.type,
      this.deadline,
      this.date,
      this.location,
      this.intro,
      this.call,
      this.pay,
      this.profile});

  Map<String, dynamic> toJson() => {
        'author': author,
        'id': id,
        'title': title,
        'info': info,
        'type': type,
        'deadline': deadline,
        'date': date,
        'location': location,
        'intro': intro,
        'call': call,
        'pay': pay,
        'profile': profile,
      };
}
