import 'package:artplatform/api/consumer_api/consumer_post_data.dart';
import 'package:flutter/material.dart';

class Longwritingbar extends StatefulWidget {
  final String title; //title 값 선언
  // final int valuekey;
  // final String formname;

  const Longwritingbar({
    super.key,
    required this.title,
    // required this.valuekey,
    // required this.formname,
  });

  @override
  State<Longwritingbar> createState() => _LongwritingbarState();
}

class _LongwritingbarState extends State<Longwritingbar> {
  final formKey = GlobalKey<FormState>();
  ConsumerFormData formData = ConsumerFormData();

  @override
  void initState() {
    super.initState();
  }

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
              widget.title, //값 입력 받는 곳
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: 360,
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
              // key: ValueKey(widget.valuekey),
              // onChanged: (value) {
              //   formData. = value;
              // },
            ),
          ),
        ],
      )),
    );
  }
}
