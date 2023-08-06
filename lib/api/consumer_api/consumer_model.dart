import 'dart:io';

class ConsumerModel {
  final String author,
      agency,
      title,
      info,
      type,
      deadline,
      date,
      location,
      profile,
      call;
  // pay;
  final int id;
  // final File profile;

  ConsumerModel.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        author = json['author'],
        agency = json['agency'],
        call = json['call'],
        title = json['title'],
        info = json['info'],
        type = json['type'],
        deadline = json['deadline'],
        date = json['date'],
        location = json['location'],
        profile = json['profile'];
  // pay = json['pay'];
}

class ConsumerFormData {
  String? author,
      agency,
      title,
      info,
      type,
      deadline,
      date,
      location,
      intro,
      call;
  // pay,
  int? id;
  File? profile;

  ConsumerFormData(
      {this.id,
      this.author,
      this.agency,
      this.title,
      this.info,
      this.type,
      this.deadline,
      this.date,
      this.location,
      this.intro,
      this.call,
      // this.pay,
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
        // 'pay': pay,
        'profile': profile,
        'agency': agency,
      };
}
