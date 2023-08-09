// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

class Imageview extends StatelessWidget {
  final String url;

  const Imageview({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    const String baseUrl =
        "http://ec2-3-39-25-227.ap-northeast-2.compute.amazonaws.com/";
    return Row(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25),
              height: 110,
              width: 360,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('사진',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('$baseUrl$url'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox()
          ],
        ),
      ],
    );
  }
}
