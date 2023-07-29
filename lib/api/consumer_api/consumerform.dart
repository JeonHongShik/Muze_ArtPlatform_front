//공고게시물 POST를 위한 페이지 수정 예정


import 'dart:convert';

import 'package:artplatform/api/consumer_api/consumer_post_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsumerForm extends StatefulWidget {
  const ConsumerForm({super.key});

  @override
  State<ConsumerForm> createState() => _ConsumerFormState();
}

class _ConsumerFormState extends State<ConsumerForm> {
  final formKey = GlobalKey<FormState>();
  ConsumerFormData formData = ConsumerFormData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '이름',
                ),
                key: const ValueKey(1),
                onChanged: (value) {
                  formData.name = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '학교',
                ),
                key: const ValueKey(2),
                onChanged: (value) {
                  formData.education = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '수상 및 수료',
                ),
                key: const ValueKey(3),
                onChanged: (value) {
                  formData.awards = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '경력',
                ),
                key: const ValueKey(4),
                onChanged: (value) {
                  formData.careers = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '자기소개서',
                ),
                key: const ValueKey(5),
                onChanged: (value) {
                  formData.introduce = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '전공',
                ),
                key: const ValueKey(6),
                onChanged: (value) {
                  formData.kind = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '나이',
                ),
                key: const ValueKey(7),
                onChanged: (value) {
                  formData.age = int.tryParse(value);
                },
              ),
              // TextFormField(
              //   key: const ValueKey(8),
              //   onChanged: (value) {
              //     formData.id = int.tryParse(value);
              //   },
              // ),
              TextButton(
                  onPressed: () async {
                    var result = await http.post(
                        Uri.parse('http://10.0.2.2:8000/resume/?format=json'),
                        body: json.encode(formData.toJson()),
                        headers: {'content-type': 'application/json'});
                    try {
                      if (result.statusCode == 201 ||
                          result.statusCode == 200) {
                        _showDialog('Successfully');
                      }
                    } catch (e) {
                      if (result.statusCode == 400) {
                        _showDialog('Failed');
                      }
                    }
                  },
                  child: const Text('save'))
            ]),
          ),
        ),
      ),
    );
  }

  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'))
              ],
            ));
  }
}
