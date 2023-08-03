import 'package:artplatform/api/resume_api/resume_apidata.dart';
import 'package:artplatform/api/resume_api/resume_model.dart';
import 'package:flutter/material.dart';

class ConsumerManagementPage extends StatelessWidget {
  ConsumerManagementPage({super.key});

  final Future<List<ResumeModel>> resumes = ResumeApiData.getResume();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            '게시글 관리',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(children: [
          FutureBuilder(
            future: resumes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    SizedBox(
                        height: 725, child: resumesList(snapshot)), //리스트뷰 화면 크기
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ]),
      ),
    );
  }

  ListView resumesList(AsyncSnapshot<List<ResumeModel>> snapshot) {
    //listView 메소드
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (context, index) {
        var resume = snapshot.data![index];
        return Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
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
                          // Icon(
                          //   Icons.bookmark_border,
                          //   size: 35,
                          // )
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
                                resume.age.toString(),
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
                              resume.career,
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
                              resume.education,
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
        ); //여기에 박스 넣고 안에 값 넣기
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 50,
      ),
    );
  }
}
