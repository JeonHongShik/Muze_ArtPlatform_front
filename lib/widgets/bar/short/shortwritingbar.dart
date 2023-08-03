import 'package:flutter/material.dart';

class Shortwritingbar extends StatefulWidget {
  final String title;

  const Shortwritingbar({
    super.key,
    required this.title,
  });

  @override
  State<Shortwritingbar> createState() => _ShortwritingbarState();
}

class _ShortwritingbarState extends State<Shortwritingbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: (Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: 170,
            height: 45,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
