import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(''),
        ),
      ),
    ));
  }
}
