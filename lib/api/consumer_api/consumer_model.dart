import 'dart:io';

class ConsumerModel {
  final String agency, title, call, pay, info, type, deadline, date, location; //성별 추가해야 함
  final File profile;

  ConsumerModel.fromjson(Map<String, dynamic> json)
      : agency = json['agency'],
        title = json['title'],
        call = json['call'],
        pay = json['pay'],
        info = json['info'],
        type = json['type'],
        deadline = json['deadline'],
        date = json['date'],
        location = json['location'],
        profile = json['profile'];
}

class ConsumerFormData {
  String? 
      agency,
      title,
      call,
      pay,
      info,
      type,
      deadline,
      date,
      location;

  File? profile;

  ConsumerFormData(
      {
      this.agency,
      this.title,
      this.call,
      this.pay,
      this.info,
      this.type,
      this.deadline,
      this.date,
      this.location,
      this.profile});

  Map<String, dynamic> toJson() => {
        'agency': agency,
        'title': title,
        'call': call,
        'pay': pay,
        'info': info,
        'type': type,
        'deadline': deadline,
        'date': date,
        'location': location,
        'profile': profile,
      };
}
