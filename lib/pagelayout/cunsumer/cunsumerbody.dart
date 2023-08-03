import 'package:artplatform/api/consumer_api/consumer_apidata.dart';
import 'package:artplatform/api/consumer_api/consumer_model.dart';
import 'package:artplatform/api/resume_api/resume_apidata.dart';
import 'package:artplatform/api/resume_api/resume_model.dart';

import 'package:artplatform/pagelayout/cunsumer/consumerpostpage.dart';
import 'package:artplatform/pagelayout/major/majorpostpage.dart';
import 'package:flutter/material.dart';

class ConsumerMainBody extends StatelessWidget {
  ConsumerMainBody({super.key});

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
                  '내가 찾는 인재!',
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
                return Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: resumesList(snapshot),
                    ),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          SizedBox(
            height: 65,
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
                  '다른 무대들도 둘러보세요!',
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
                return Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: consumersList(snapshot),
                    ),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
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
      itemCount: 5,
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
          child: SizedBox(
            width: 400,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
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
                    child: Container(
                      //API 요소 위치를 위한 박스
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Column(
                        children: [
                          Row(
                            //유저 프로필, 이름, 북마크
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                //유저 프로필, 이름 붙이기 위한 Row
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                  Text(
                                    resume.author,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.bookmark_border,
                                size: 35,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 310,
                            height: 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 25,
                                // decoration: BoxDecoration(
                                //   color: Colors.pink.withOpacity(0.3),
                                //   borderRadius: BorderRadius.all(
                                //     Radius.circular(20),
                                //   ),
                                // ),
                                child: Center(
                                  child: Row(
                                    //아이콘 + 정보
                                    children: [
                                      Icon(Icons.abc),
                                      Text(
                                        resume.age.toString(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 70,
                                height: 25,
                                // decoration: BoxDecoration(
                                //   color: Colors.pink.withOpacity(0.3),
                                //   borderRadius: BorderRadius.all(
                                //     Radius.circular(20),
                                //   ),
                                // ),
                                child: Center(
                                    child: Row(
                                  children: [
                                    Icon(Icons.abc),
                                    Text(
                                      resume.career,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                              SizedBox(
                                width: 70,
                                height: 25,
                                // decoration: BoxDecoration(
                                //   color: Colors.pink.withOpacity(0.3),
                                //   borderRadius: BorderRadius.all(
                                //     Radius.circular(20),
                                //   ),
                                // ),
                                child: Center(
                                    child: Row(
                                  children: [
                                    Icon(Icons.abc),
                                    Text(
                                      resume.education,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                              )
                            ],
                          )
                        ],
                      ),
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
          child: SizedBox(
            width: 400,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
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
                    child: Container(
                      //API 요소 위치를 위한 박스
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Column(
                        children: [
                          Row(
                            //유저 프로필, 이름, 북마크
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                //유저 프로필, 이름 붙이기 위한 Row
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                  Text(
                                    consumer.title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.bookmark_border,
                                size: 35,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    consumer.type,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  consumer.location,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                              Container(
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  consumer.info,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              )
                            ],
                          )
                        ],
                      ),
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
