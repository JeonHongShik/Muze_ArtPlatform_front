import 'package:flutter/material.dart';

class Shortpostbar extends StatelessWidget {
  final String title_1;
  final String title_2;
  final dynamic data1;
  final dynamic data2;

  const Shortpostbar({
    super.key,
    required this.title_1,
    required this.title_2,
    required this.data1,
    required this.data2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 25),
          height: 70,
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title_1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                data1.toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 25),
          height: 70,
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title_2,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                data2.toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
