import 'package:artplatform/pagelayout/boardpage/resumestageboardpage.dart';
import 'package:artplatform/pagelayout/mypages/majormypage.dart';
import 'package:artplatform/pagelayout/boardpage/resumeboardpage.dart';
import 'package:artplatform/pagelayout/boardpage/favorites.dart';
import 'package:artplatform/pagelayout/major/majormainbody.dart';
import 'package:flutter/material.dart';

class MajorMainPage extends StatefulWidget {
  const MajorMainPage({super.key});

  @override
  State<MajorMainPage> createState() => _MajorMainPageState();
}

class _MajorMainPageState extends State<MajorMainPage> {
  var tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        //상단바
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo1.png',
              fit: BoxFit.contain,
              height: 40,
            ),
            Text(
              'Art Platform',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MajorMypage()),
              );
            },
            icon: const Icon(Icons.account_circle),
            color: Colors.pink,
            iconSize: 35,
          )
        ],
      ),
      body: [
        MajorMainBody(),
        ResumeStageBoardPage(),
        ResumeBoardPage(),
        FavoritesPage(),
      ][tab], //바디 하단바 아이콘 누르면 이동
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/Logo1.png',
                    fit: BoxFit.contain,
                    height: 40,
                  ),
                  Text(
                    'Art Platform',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                '공고 게시판',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                '이력서 게시판',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                '즐겨찾는 게시물',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
        type: BottomNavigationBarType.fixed, //아이콘 3개이상이면 넣어줘야 함.
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
              Icons.list_alt_sharp,
              color: Colors.pink.shade300,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_sharp,
              color: Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
              color: Colors.red,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
