// ignore_for_file: unused_import

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Imageuploader extends StatefulWidget {
  const Imageuploader({super.key});

  @override
  State<Imageuploader> createState() => _ImageuploaderState();
}

class _ImageuploaderState extends State<Imageuploader> {
  @override
  void initState() {
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();
  List<XFile> _pickedImgs = [];

  Future<void> _pickImg() async {
    final List<XFile> images = await _picker.pickMultiImage();
    setState(() {
      _pickedImgs = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPadMode = MediaQuery.of(context).size.width > 700;

    List<Widget> boxContents = [
      IconButton(
          onPressed: () {
            _pickImg();
          },
          icon: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add_a_photo_rounded,
                color: Theme.of(context).colorScheme.primary,
              ))),
      Container(),
      Container(),
      _pickedImgs.length <= 3
          ? Container()
          : FittedBox(
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    shape: BoxShape.circle),
                child: Text(
                  '+${(_pickedImgs.length - 4).toString()}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
            ),
    ];

    return GridView.count(
      shrinkWrap: true,
      padding: const EdgeInsets.all(2),
      crossAxisCount: isPadMode ? 4 : 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: List.generate(
        4,
        (index) => DottedBorder(
          color: Colors.grey,
          dashPattern: const [5, 3],
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          child: Container(
            decoration: index <= _pickedImgs.length - 1
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(_pickedImgs[index].path))))
                : null,
            child: Center(child: boxContents[index]),
          ),
        ),
      ).toList(),
    );
  }
}
