import 'package:flutter/material.dart';
import 'package:artplatform/hcw/long/longwritingbar.dart';
import 'package:artplatform/hcw/short/shortwritingbar.dart';

class Majorwritingpage extends StatefulWidget {
  const Majorwritingpage({super.key});

  @override
  State<Majorwritingpage> createState() => _MajorwritingpageState();
}

class _MajorwritingpageState extends State<Majorwritingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
                      // child: const ImageUpload(),
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
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
    );
  }
}
