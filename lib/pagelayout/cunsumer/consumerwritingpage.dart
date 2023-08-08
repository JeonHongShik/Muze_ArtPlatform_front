//모집기한, 공연일시 textformfield가 없음
// 92줄 유저 이름 들어가야 함
// 게시물 성별 들어가야 함
// 프로필 사진 받아오게 코드 수정

import 'dart:convert';
import 'package:artplatform/widgets/imageuploader/imageupload.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:http/http.dart' as http;
import 'package:artplatform/api/consumer_api/consumer_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Consumerwritingpage extends StatefulWidget {
  const Consumerwritingpage({super.key});

  @override
  State<Consumerwritingpage> createState() => _ConsumerwritingpageState();
}

class _ConsumerwritingpageState extends State<Consumerwritingpage> {
  TextEditingController dateinput1 = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ConsumerFormData formData = ConsumerFormData();

  var userImage;

  @override
  void initState() {
    dateinput1.text = "";
    dateinput2.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                child: Row(
                  children: [
                    Text(
                      '게시글 작성',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 10, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 62,
                      height: 62,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 45,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                label: Text('이름'),
                              ),
                              // key: ValueKey(1),   //유저 이름 들어갸야 함
                              // onChanged: (value) {
                              //   formData.author = value;
                              // }, 
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '제목',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 360,
                      height: 45,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        key: ValueKey(2),
                        onChanged: (value) {
                          formData.title = value;
                        },
                      ),
                    ),
                  ],
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '기관명',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          height: 45,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            key: ValueKey(3),
                            onChanged: (value) {
                              formData.agency = value;
                            },
                          ),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '공연 종류',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          height: 45,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            key: ValueKey(4),
                            onChanged: (value) {
                              formData.type = value;
                            },
                          ),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '페이',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          height: 45,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            key: ValueKey(5),
                            onChanged: (value) {
                              // formData.pay = value;
                            },
                          ),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '연락 수단',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          height: 45,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            key: ValueKey(6),
                            onChanged: (value) {
                              formData.call = value;
                            },
                          ),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            '모집 기한',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0,
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 120,
                          height: 45,
                          child: TextFormField(
                            controller: dateinput1,
                            decoration: InputDecoration(
                                icon: Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                            )),
                            readOnly: true,
                            onTap: () {
                              var date = DateTime.now();
                              showMaterialDatePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                selectedDate: date,
                                onChanged: (value) => setState(
                                  () {
                                    date = value;
                                    dateinput1.text =
                                        "${date.year}-${date.month}-${date.day}";
                                    formData.deadline =
                                        "${date.year}-${date.month}-${date.day}";
                                  },
                                ),
                              );
                            },
                            key: ValueKey(7),
                            onChanged: (value) {
                              formData.deadline = value.toString();
                            },
                          ),
                        ),
                      ],
                    )),
                  ),
                  const SizedBox(
                    width: 73,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            '공연 일시',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0,
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 120,
                          height: 45,
                          child: TextFormField(
                            controller: dateinput2,
                            decoration: InputDecoration(
                                icon: Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                            )),
                            readOnly: true,
                            onTap: () {
                              var date = DateTime.now();
                              showMaterialDatePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                selectedDate: date,
                                onChanged: (value) => setState(
                                  () {
                                    date = value;
                                    dateinput2.text =
                                        "${date.year}-${date.month}-${date.day}";
                                    formData.date =
                                        "${date.year}-${date.month}-${date.day}";
                                  },
                                ),
                              );
                            },
                            key: ValueKey(8),
                            onChanged: (value) {
                              formData.date = value.toString();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '위치',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 360,
                      height: 45,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        key: ValueKey(9),
                        onChanged: (value) {
                          formData.location = value;
                        },
                      ),
                    ),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 17,
                          ),
                          Text(
                            '사진',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            key: ValueKey(10),
                            icon: Icon(Icons.add_box_outlined),
                            onPressed: () async {
                              var picker = ImagePicker();
                              var image = await picker.pickImage(source: ImageSource.gallery);
                              if (image != null) {
                                setState(() {
                                  userImage = File(image.path);
                                });
                              }

                              setState(() {
                                userImage = images;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 400,
                      child: Image.file(userImage),
                    ),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        '게시글 내용',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 360,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                            bottom: 200,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        key: ValueKey(11),
                        onChanged: (value) {
                          formData.info = value;
                        },
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 84, 84),
        onPressed: () async {
          var result = await http.post(
              Uri.parse('http://ec2-3-39-25-227.ap-northeast-2.compute.amazonaws.com/post/'),
              body: json.encode(formData.toJson()),
              headers: {'content-type': 'application/json'});
          try {
            if (result.statusCode == 201 || result.statusCode == 200) {
              _showDialog('Successfully');
            }
          } catch (e) {
            if (result.statusCode == 400) {
              _showDialog('Try again');
            }
          }
        },
        child: const Text(
          '업로드',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
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
