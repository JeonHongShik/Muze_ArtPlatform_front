import 'package:flutter/material.dart';

class Shortpostbar extends StatelessWidget {
  final String title_1;
  final String title_2;

  const Shortpostbar({
    super.key,
    required this.title_1,
    required this.title_2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25),
              height: 50,
              width: 160,
              child: Text(title_1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox()
          ],
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25),
              height: 50,
              width: 160,
              child: Text(title_2,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox()
          ],
        ),
      ],
    );
  }
}
