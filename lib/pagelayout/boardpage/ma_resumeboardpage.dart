import 'package:artplatform/pagelayout/major/majorpostpage.dart';
import 'package:flutter/material.dart';
import 'package:artplatform/api/resume_api/resume_apidata.dart';
import 'package:artplatform/api/resume_api/resume_model.dart';

class MaResumeBoardPage extends StatelessWidget {
  MaResumeBoardPage({super.key});

  final Future<List<ResumeModel>> resumes = ResumeApiData.getResume();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  color: Colors.pink.withOpacity(0.2),
                  margin: EdgeInsets.only(left: 22),
                  child: Text(
                    "이력서 게시판",
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
                      hintText: '인재를 검색해보세요!',
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
                                    resume.name,
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
