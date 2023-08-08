import 'package:artplatform/api/consumer_api/consumer_apidata.dart';
import 'package:artplatform/api/consumer_api/consumer_model.dart';
import 'package:artplatform/pagelayout/cunsumer/consumerpostpage.dart';
import 'package:flutter/material.dart';

import '../../providers/currentUser.dart';

class ConsumerManagementPage extends StatelessWidget {
  ConsumerManagementPage({super.key});
  late CurrentUserProvider _currentUserProvider;
  final Future<List<ConsumerModel>> consumers = ConsumerApiData.getConsumer();
  // final Future<List<ConsumerModel>> mylist = ConsumerApiData.getConsumer(_currentUserProvider.user!.id);
  ////본인 데이터 불러오는 함수로 바꿔줘야 함

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          future: consumers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return (snapshot.data!.isNotEmpty)
                  ? Column(
                      children: [
                        SizedBox(
                            height: 725,
                            child: consumersList(snapshot)), //리스트뷰 화면 크기
                      ],
                    )
                  : Text('no data 상규');
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ]),
    );
  }

  ListView consumersList(AsyncSnapshot<List<ConsumerModel>> snapshot) {
    //listView 메소드
    List<ConsumerModel> reversedList = snapshot.data!.reversed.toList();
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: 1,
      itemBuilder: (context, index) {
        var consumer = reversedList[index];
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
            height: 230,
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
                                  // Icon(
                                  //   Icons.bookmark_border,
                                  //   size: 30,
                                  // ),
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
