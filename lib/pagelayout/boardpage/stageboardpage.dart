import 'package:artplatform/hcw/consumer/consumerwritingpage.dart';
import 'package:flutter/material.dart';
import 'package:artplatform/api/resume_api/resume_apidata.dart';
import 'package:artplatform/api/resume_api/resume_model.dart';

class StageBoardPage extends StatelessWidget {
  StageBoardPage({super.key});

  final Future<List<ResumeModel>> resumes = ApiData.getResume();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.pink.withOpacity(0.2),
                  margin: EdgeInsets.only(left: 22),
                  child: Text(
                    "무대 게시판",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              //검색바, 필터아이콘 추가를 위한 Row
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //검색바
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                  width: 330,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      hintText: '무대를 검색해보세요!',
                    ),
                  ),
                ),
                SizedBox(
                  //필터 아이콘
                  child: Container(
                    margin: EdgeInsets.only(right: 12),
                    child: PopupMenuButton(
                      icon: Icon(
                        Icons.filter_list_alt,
                        size: 30,
                      ),
                      itemBuilder: ((context) => [
                            PopupMenuItem(value: 1, child: Text("first")),
                            PopupMenuItem(value: 2, child: Text("Second")),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: resumes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 620, child: resumesList(snapshot)),
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 255, 84, 84),
          onPressed: () {},
          child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Consumerwritingpage(),
                  ),
                );
              },
              icon: Icon(Icons.add)),
        ),
      ),
    );
  }

  ListView resumesList(AsyncSnapshot<List<ResumeModel>> snapshot) {
    //listView 메소드

    List<ResumeModel> reversedList = snapshot.data!.reversed.toList();

    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: reversedList.length,
      itemBuilder: (context, index) {
        var resume = reversedList[index];
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
                                resume.name,
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
                                resume.kind,
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
                              resume.careers,
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
