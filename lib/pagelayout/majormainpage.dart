import 'package:artplatform/widgets/common/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

class MajorMainPage extends StatelessWidget {
  const MajorMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'ArtPlatform',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
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
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 350,
                height: 50,
                color: Colors.white,
                child: const Text(
                  '당신의 재능이 필요해요!',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ]),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 350,
                height: 50,
                color: Colors.white,
                child: const Text(
                  '다른 사람들은 이런 재능이 있어요!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar());
  }
}
