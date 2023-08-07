import 'package:flutter/material.dart';

class Longpostbar extends StatelessWidget {
  final String title;
  final String data;

  const Longpostbar({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
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
                  Text(title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.toString(),
                    style: TextStyle(fontSize: 16),
                  )
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
