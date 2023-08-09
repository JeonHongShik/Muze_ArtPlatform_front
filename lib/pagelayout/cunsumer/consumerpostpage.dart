// 61줄 유저 이름 들어가야 함
// 게시물 성별 들어가야 함
// 프로필 사진 받아오게 코드 수정

import 'package:artplatform/api/consumer_api/consumer_model.dart';
import 'package:artplatform/widgets/bar/long/longpostbar.dart';
import 'package:artplatform/widgets/bar/short/shortpostbar.dart';
import 'package:artplatform/widgets/imageuploader/imageview.dart';
import 'package:flutter/material.dart';

class Consumerpostpage extends StatelessWidget {
  const Consumerpostpage({super.key});

  @override
  Widget build(BuildContext context) {
    final consumer =
        ModalRoute.of(context)!.settings.arguments as ConsumerModel;

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
                            padding: const EdgeInsets.all(10),
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
                                            "이름", //유저 이름 들어갸야 함
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
                                title_1: '기관명',
                                data1: consumer.agency,
                                title_2: '공연종류',
                                data2: consumer.type,
                              ), //기관명, 공연종류
                              SizedBox(
                                height: 50,
                              ),
                              Shortpostbar(
                                title_1: '성별',
                                data1: consumer.gender,
                                title_2: '페이',
                                data2: consumer.pay.toString(),
                              ), // 성별, 페이
                              SizedBox(
                                height: 50,
                              ),
                              Shortpostbar(
                                title_1: '모집기한',
                                data1: consumer.deadline,
                                title_2: '일시',
                                data2: consumer.date,
                              ), //모집기한, 일시
                              SizedBox(
                                height: 50,
                              ),
                              Longpostbar(
                                title: '위치',
                                data: consumer.location,
                              ), //일시
                              SizedBox(
                                height: 50,
                              ),
                              Longpostbar(
                                title: '공연소개',
                                data: consumer.info,
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              Imageview(url: consumer.profile),
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
