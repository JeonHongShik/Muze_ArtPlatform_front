import 'package:artplatform/widgets/imageupload.dart';
import 'package:image_picker/image_picker.dart';
import 'package:artplatform/widgets/longwritingbar.dart';
import 'package:artplatform/widgets/shortwritingbar.dart';
import 'package:flutter/material.dart';

class Majorwritingpage extends StatefulWidget {
  const Majorwritingpage({super.key});

  @override
  State<Majorwritingpage> createState() => _MajorwritingpageState();
}

final picker = ImagePicker();
XFile? image; // 카메라로 촬영한 이미지를 저장할 변수
List<XFile?> multiImage = []; // 갤러리에서 여러장의 사진을 선택해서 저장할 변수
List<XFile?> images = []; // 가져온 사진들을 보여주기 위한 변수

class _MajorwritingpageState extends State<Majorwritingpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
            ),
          ),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                child: Image.asset(
                  "images/apflogo.png",
                  width: 52,
                  height: 52,
                ),
              ),
              const Text(
                'Art Platform',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
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
                        '이력서',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Shortwritingbar(title: '나이'),
                    SizedBox(
                      width: 20,
                    ),
                    Shortwritingbar(title: '연락 수단'),
                  ],
                ),
                const Longwritingbar(title: '경력'),
                const Longwritingbar(title: '수상 및 수료'),
                const Longwritingbar(title: '학력'),
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
                        width: 360,
                        height: 200,
                        child: const ImageUpload(),
                      ),
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 0, 0),
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          '자기소개서',
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
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
          onPressed: () {},
          child: const Text(
            'SAVE',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
