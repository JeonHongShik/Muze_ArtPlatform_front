import 'package:artplatform/pagelayout/mypages/consumermanagementpage.dart';
import 'package:flutter/material.dart';

class CunsumerMypage extends StatefulWidget {
  const CunsumerMypage({super.key});

  @override
  State<CunsumerMypage> createState() => _CunsumerMypagestate();
}

class _CunsumerMypagestate extends State<CunsumerMypage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 22.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 227, 227),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 253, 192, 192),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 45,
                        height: 45,
                        child: const Icon(
                          color: Colors.white,
                          Icons.person_outlined,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '조은성님!  반가워요!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.settings,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 22.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 45,
                        height: 45,
                        child: const Icon(
                          color: Color.fromARGB(255, 255, 148, 40),
                          Icons.post_add_outlined,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 23,
                      ),
                      const Text(
                        '게시물 관리',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ConsumerManagementPage(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.border_color_rounded,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
