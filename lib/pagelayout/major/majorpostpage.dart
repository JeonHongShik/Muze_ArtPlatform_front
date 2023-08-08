// 61줄 유저 이름 들어가야 함
// 게시물 성별 들어가야 함
// 프로필 사진 받아오게 코드 수정

import 'package:artplatform/api/resume_api/resume_model.dart';
import 'package:artplatform/widgets/bar/long/longpostbar.dart';
import 'package:artplatform/widgets/bar/short/shortpostbar.dart';

import 'package:flutter/material.dart';

class Majorpostpage extends StatelessWidget {
  const Majorpostpage({super.key});

  @override
  Widget build(BuildContext context) {
    final resume = ModalRoute.of(context)!.settings.arguments as ResumeModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
          "assets/images/Logo1.png",
          width: 52,
          height: 52,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Column(
              children: [
                Row(
                  //박스 안 요소
                  children: [
                    SizedBox(
                      width: 390,
                      child: Column(
                        children: [
                          Container(
                            //사용자 이미지, 이름, 책갈피
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      //오류 나는 부분

                                      child: Icon(
                                        Icons.account_circle_rounded,
                                        size: 70,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "이름", //이름
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text('25 minutes ago'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.bookmark_border_outlined,
                                  size: 30,
                                ),
                              ],
                            ),
                          ), //사용자 정보 끝
                          Container(
                            // 구분선
                            margin: const EdgeInsets.all(10),
                            height: 1,
                            width: 360,
                            color: const Color.fromARGB(255, 202, 202, 202),
                          ),
                          Column(
                            children: [
                              Shortpostbar(
                                title_1: '나이',
                                data1: resume.age,
                                title_2: '연락 수단',
                                data2: resume.call,
                              ), //나이, 연락수단

                              const SizedBox(
                                height: 23,
                              ),
                              Container(
                                // 구분선
                                margin: const EdgeInsets.all(10),
                                height: 1,
                                width: 360,
                                color: const Color.fromARGB(255, 202, 202, 202),
                              ),
                              Longpostbar(
                                title: '경력',
                                data: resume.career,
                              ), //경력
                              const SizedBox(
                                height: 23,
                              ),
                              Container(
                                // 구분선
                                margin: const EdgeInsets.all(10),
                                height: 1,
                                width: 360,
                                color: const Color.fromARGB(255, 202, 202, 202),
                              ),
                              Longpostbar(
                                title: '학력',
                                data: resume.education,
                              ), //학력
                              const SizedBox(
                                height: 23,
                              ),
                              // Container(
                              //   // 구분선
                              //   margin: const EdgeInsets.all(10),
                              //   height: 1,
                              //   width: 360,
                              //   color: const Color.fromARGB(255, 202, 202, 202),
                              // ),
                              //  Longpostbar(title: '위치', resume.), //일시
                              const SizedBox(
                                height: 23,
                              ),
                              Container(
                                // 구분선
                                margin: const EdgeInsets.all(10),
                                height: 1,
                                width: 360,
                                color: const Color.fromARGB(255, 202, 202, 202),
                              ),
                              Longpostbar(
                                title: '사진',
                                data: "수정해야 함",
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              Container(
                                // 구분선
                                margin: const EdgeInsets.all(10),
                                height: 1,
                                width: 360,
                                color: const Color.fromARGB(255, 202, 202, 202),
                              ),
                              Longpostbar(
                                title: '자기소개서',
                                data: resume.introduce,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
