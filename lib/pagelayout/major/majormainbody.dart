// 241줄 유저 이름 들어가야 함
// 게시물 성별 들어가야 함
// 프로필 사진 받아오게 코드 수정

import 'package:artplatform/api/consumer_api/consumer_apidata.dart';
import 'package:artplatform/api/consumer_api/consumer_model.dart';
import 'package:artplatform/api/resume_api/resume_apidata.dart';
import 'package:artplatform/api/resume_api/resume_model.dart';
import 'package:artplatform/pagelayout/cunsumer/consumerpostpage.dart';
import 'package:artplatform/pagelayout/major/majorpostpage.dart';
import 'package:flutter/material.dart';

class MajorMainBody extends StatelessWidget {
  MajorMainBody({super.key});

  final Future<List<ResumeModel>> resumes = ResumeApiData.getResume();
  final Future<List<ConsumerModel>> consumers = ConsumerApiData.getConsumer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25),
              ),
              Container(
                width: 315,
                color: Colors.white,
                child: Text(
                  '당신의 재능이 필요해요!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                child: IconButton(
                  icon: Icon(Icons.double_arrow_rounded),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: consumers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return (snapshot.data!.isNotEmpty)
                    ? Column(
                        // 공고 게시물 표시
                        children: [
                          SizedBox(
                            height: 225, // 둥근 박스의 뒷쪽 박스
                            width: 400,
                            child: consumersList(snapshot),
                          ),
                        ],
                      )
                    : Text(('no data 상규'));
              }
              return Center(
                //공고 게시물 값이 없을 때 표시
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  width: 350,
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Text('게시물이 없어요.'),
                ),
              );
            },
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25),
              ),
              Container(
                width: 315,
                color: Colors.white,
                child: Text(
                  '다른 사람들은 이런 재능이 있어요!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                child: IconButton(
                  icon: Icon(Icons.double_arrow_rounded),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: resumes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return (snapshot.data!.isNotEmpty)
                    ? Column(
                        //이력서 게시물 표시
                        children: [
                          SizedBox(
                            height: 230, // 둥근 박스의 뒷쪽 박스
                            width: 400,
                            child: resumesList(snapshot),
                          ),
                        ],
                      )
                    : Text('no data 상규');
              }
              return Center(
                //이력서 게시물 값이 없을 때 표시
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  width: 350,
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Text('게시물이 없어요.'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  ListView resumesList(AsyncSnapshot<List<ResumeModel>> snapshot) {
    //listView 메소드
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        var resume = snapshot.data![index];

        return GestureDetector(
          onTap: () {
            // 게시물 목록에서 게시물 클릭 시 게시물 세부 페이지로 넘어가게 하기 위한 곳
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Majorpostpage(),
                settings: RouteSettings(
                  arguments: resume,
                ),
              ),
            );
          },
          child: Container(
            //이 컨테이너는 둥근 박스 뒷쪽 박스
            width: 400, //여기서는 가로 조절만 됨, 세로 조절은 위에서 됨.
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Container(
                    // Radius 적용된 박스
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: 360,
                    height: 200, //둥근 박스 높이
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          width: 330,
                          child: Row(
                            //유저 프로필, 이름, 북마크
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                //유저 프로필, 이름 붙이기 위한 Row
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                    size: 50,
                                    color: Colors.red.shade200,
                                  ),
                                  SizedBox(
                                    //아이콘과 이름 사이 여백
                                    width: 5,
                                  ),
                                  Text(
                                    "이름",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              // Icon(
                              //   Icons.bookmark_border,
                              //   size: 35,
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          // 나누는 바 윗쪽 여백
                          height: 15,
                        ),
                        Container(
                          // 사용자 이름과 요소 나누는 바
                          width: 320,
                          height: 1,
                          color: Colors.pink,
                        ),
                        SizedBox(
                          // 나누는 바 아래쪽 여백
                          height: 20,
                        ),
                        Container(
                          color: Colors.white,
                          width: 300,
                          height: 100,
                          child: Column(
                            children: [
                              Row(
                                //나이, 성별 넣기 위한 Row
                                children: [
                                  Row(
                                    //아이콘+나이 넣기 위한 Row
                                    children: [
                                      Icon(Icons.person),
                                      Text(
                                        "${resume.age}세",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    //나이와 성별 사이 여백
                                    width: 90,
                                  ),
                                  Row(
                                    //아이콘+성별 넣기 위한 Row
                                    children: const [
                                      Icon(Icons.male),
                                      Icon(Icons.female),
                                      Text(
                                        "남성",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                //나이,성별과 학력 사이 여백
                                height: 30,
                              ),
                              Row(
                                //아이콘+학력 넣기 위한 Row
                                children: [
                                  Icon(Icons.school),
                                  Text(
                                    resume.education,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ); //여기에 박스 넣고 안에 값 넣기
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 50,
      ),
    );
  }

  ListView consumersList(AsyncSnapshot<List<ConsumerModel>> snapshot) {
    //listView 메소드
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        var consumer = snapshot.data![index];
        return GestureDetector(
          onTap: () {
            // 게시물 목록에서 게시물 클릭 시 게시물 세부 페이지로 넘어가게 하기 위한 곳
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Consumerpostpage(),
                settings: RouteSettings(
                  arguments: consumer,
                ),
              ),
            );
          },
          child: Container(
            //이 컨테이너는 둥근 박스 뒷쪽 박스
            width: 400, //여기서는 가로 조절만 됨, 세로 조절은 위에서 됨.
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Container(
                    // Radius 적용된 박스
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: 360,
                    height: 200, //둥근 박스 높이
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: Colors.white,
                          width: 330,
                          height: 40,
                          child: Column(
                            //유저,북마크와 제목
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                //유저 프로필, 이름, 북마크
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        consumer.title,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.bookmark_border,
                                    size: 30,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: const [
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          // 나누는 바 윗쪽 여백
                          height: 15,
                        ),
                        Container(
                          // 사용자 이름과 요소 나누는 바
                          width: 320,
                          height: 1,
                          color: Colors.pink,
                        ),
                        SizedBox(
                          // 나누는 바 아래쪽 여백
                          height: 20,
                        ),
                        Container(
                          color: Colors.white,
                          width: 300,
                          height: 80,
                          child: Column(
                            children: [
                              Row(
                                //나이, 성별 넣기 위한 Row
                                children: [
                                  Row(
                                    //아이콘+나이 넣기 위한 Row
                                    children: [
                                      Icon(Icons.person),
                                      Text(
                                        consumer.type,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    //나이와 성별 사이 여백
                                    width: 35,
                                  ),
                                  Row(
                                    //아이콘+성별 넣기 위한 Row
                                    children: const [
                                      Icon(Icons.male),
                                      Icon(Icons.female),
                                      Text(
                                        "남성",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        //나이와 성별 사이 여백
                                        width: 35,
                                      ),
                                      Row(
                                        //아이콘+학력 넣기 위한 Row
                                        children: [
                                          Icon(Icons.attach_money),
                                          Text(
                                            "20만원",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                //나이,성별과 학력 사이 여백
                                height: 30,
                              ),
                              Row(
                                //아이콘+학력 넣기 위한 Row
                                children: [
                                  Icon(Icons.location_on),
                                  Text(
                                    consumer.location,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ); //여기에 박스 넣고 안에 값 넣기
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 50,
      ),
    );
  }
}
