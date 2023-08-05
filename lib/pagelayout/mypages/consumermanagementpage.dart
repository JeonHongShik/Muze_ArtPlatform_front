import 'package:artplatform/api/resume_api/resume_apidata.dart';
import 'package:artplatform/api/resume_api/resume_model.dart';
import 'package:artplatform/pagelayout/major/majorpostpage.dart';
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
      itemCount: 1,
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
            height: 230, //세로 스크롤이기 때문에 둥근 박스의 뒷쪽 박스 조절 됨
            width: 400, //여기서는 가로 조절만 됨, 세로 조절은 위에서 됨.
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 20,
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
                                    resume.author,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.bookmark_outlined,
                                size: 35,
                                color: Colors.pink,
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
                                          fontWeight: FontWeight.bold,
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
                                          fontWeight: FontWeight.bold,
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
                                      fontWeight: FontWeight.bold,
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
}