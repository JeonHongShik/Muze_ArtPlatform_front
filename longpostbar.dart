import 'package:flutter/material.dart';

class Longpostbar extends StatelessWidget {
  final String title;

  const Longpostbar({
    super.key,
    required this.title,
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
              child: Text(title,
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
