//모집기한, 공연일시 textformfield가 없음

import 'dart:convert';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:http/http.dart' as http;
import 'package:artplatform/api/consumer_api/consumer_model.dart';
import 'package:flutter/material.dart';

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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'data',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'data',
                            style: TextStyle(
                              color: Colors.grey,
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
                        '게시글 제목',
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
                        key: ValueKey(1),
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
                            key: ValueKey(2),
                            onChanged: (value) {
                              formData.author = value;
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
                            '무대 정보',
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
                              formData.info = value;
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
                            '공연 페이',
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
                              formData.pay = value;
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
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 170,
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
                              // key: ValueKey(6),
                              // onChanged: (value) {
                              //   formData.deadline = value.toString();
                              // },
                            )
                            // Row(
                            //   children: [
                            //     const Text(''),
                            //     IconButton(
                            //       onPressed: () {
                            //         showDatePicker(
                            //           context: context,
                            //           initialDate: DateTime.now(),
                            //           firstDate: DateTime(1900),
                            //           lastDate: DateTime.now(),
                            //         ).then((selectedDate) {
                            //           setState(() {
                            //             // _selectedDate = selectedDate;
                            //           });
                            //         });
                            //       },
                            //       icon: const Icon(
                            //         Icons.calendar_month_outlined,
                            //         color: Colors.grey,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            ),
                      ],
                    )),
                  ),
                  const SizedBox(
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
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 170,
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
                            // key: ValueKey(7),
                            // onChanged: (value) {
                            //   formData.date = value;
                            // },
                          ),
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
                                  '공연 페이',
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
                                  key: ValueKey(11),
                                  onChanged: (value) {
                                    formData.call = value;
                                  },
                                ),
                              ),
                            ],
                          )),
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
                        key: ValueKey(8),
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
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        '사진',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 90,
                      height: 90,
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
                          formData.profile = value;
                        },
                      ),
                      // child: const ImageUpload(),
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
                        key: ValueKey(10),
                        onChanged: (value) {
                          formData.intro = value;
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
              Uri.parse('http://10.0.2.2:8000/post/?format=json'),
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
