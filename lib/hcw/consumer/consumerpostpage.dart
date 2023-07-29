import 'package:flutter/material.dart';
import 'package:artplatform/hcw/short/shortpostbar.dart';
import 'package:artplatform/hcw/long/longpostbar.dart';

class Consumerpost extends StatefulWidget {
  const Consumerpost({super.key});

  @override
  State<Consumerpost> createState() => _ConsumerpostState();
}

class _ConsumerpostState extends State<Consumerpost> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
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
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '이화수',
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
                              children: const [
                                Shortpostbar(
                                    title_1: '기관명',
                                    title_2: '무대정보'), //기관명, 무대정보
                                SizedBox(
                                  height: 50,
                                ),
                                Shortpostbar(
                                    title_1: '공연종류', title_2: '페이'), // 공연종류, 페이
                                SizedBox(
                                  height: 50,
                                ),
                                Shortpostbar(
                                    title_1: '모집기한', title_2: '일시'), //모집기한, 일시
                                SizedBox(
                                  height: 50,
                                ),
                                Longpostbar(title: '위치'), //일시
                                SizedBox(
                                  height: 50,
                                ),
                                Longpostbar(title: '사진'),
                                SizedBox(
                                  height: 150,
                                ),
                                Longpostbar(title: '공연소개'),
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
      ),
    );
  }
}
