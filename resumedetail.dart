import 'package:flutter/material.dart';

class ResumeDetail extends StatelessWidget {
  const ResumeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            "아이콘",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.black,
            onPressed: () => {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
              color: Colors.black,
            )
          ],
        ),
        body: Container(
          color: Colors.black.withOpacity(0.2),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 60, 20, 0),
                  ),
                  Row(
                    //중앙 박스
                    children: [
                      Container(
                        width: 392,
                        height: 1000,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                        ),
                        child: Row(
                          //박스 안 요소
                          children: [
                            SizedBox(
                              width: 390,
                              height: 1000,
                              child: Column(
                                children: [
                                  Container(
                                    //사용자 이미지, 이름, 책갈피
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              //오류 나는 부분

                                              child: Icon(
                                                Icons.account_circle_rounded,
                                                size: 60,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '이화수',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text('25 minutes ago'),
                                              ],
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
                                    margin: EdgeInsets.all(10),
                                    height: 1,
                                    width: 350,
                                    color: Colors.black,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25),
                                                height: 50,
                                                width: 160,
                                                child: Text('기관명',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                              SizedBox()
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 25),
                                            height: 50,
                                            width: 160,
                                            child: Text(
                                              '무대 정보',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ), //기관명, 무대정보
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25),
                                                height: 50,
                                                width: 160,
                                                child: Text('공연 종류',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                              SizedBox()
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 25),
                                            height: 50,
                                            width: 160,
                                            child: Text(
                                              '페이',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ), // 공연종류, 페이
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25),
                                                height: 50,
                                                width: 160,
                                                child: Text('모집기한',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                              SizedBox()
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 25),
                                            height: 50,
                                            width: 160,
                                            child: Text(
                                              '일시',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ), //모집기한, 일시
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25),
                                                height: 50,
                                                width: 160,
                                                child: Text('위치',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                              SizedBox()
                                            ],
                                          ),
                                        ],
                                      ), //일시
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25),
                                                height: 50,
                                                width: 160,
                                                child: Text(
                                                  '사진/동영상',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              //이 자리에 사진/동영상 넣을 수 있는 공간 만들어야 함
                                              SizedBox()
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 150,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25),
                                                height: 50,
                                                width: 160,
                                                child: Text(
                                                  '공연 소개',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              //이 자리에 사진/동영상 넣을 수 있는 공간 만들어야 함
                                              SizedBox()
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ), //박스 안 요소 끝
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          //하단바
          items: <BottomNavigationBarItem>[
            //하단바 아이콘
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: Colors.pink.shade300,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border_outlined,
                color: Colors.black,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
