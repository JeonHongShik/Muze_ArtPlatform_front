import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => ImageUploadState();
}

final picker = ImagePicker();
XFile? image; // 카메라로 촬영한 이미지를 저장할 변수
List<XFile?> multiImage = []; // 갤러리에서 여러장의 사진을 선택해서 저장할 변수
List<XFile?> images = []; // 가져온 사진들을 보여주기 위한 변수

class ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        IconButton(
            onPressed: () async {
              multiImage = await picker.pickMultiImage();
              setState(() {
                //갤러리에서 가지고 온 사진들은 리스트 변수에 저장되므로 addAll()을 사용해서 images와 multiImage 리스트를 합쳐줍니다.
                images.addAll(multiImage);
              });
            },
            icon: const Icon(
              Icons.add_rounded,
              size: 30,
              color: Colors.grey,
            )),
        Container(
          margin: const EdgeInsets.all(10),
          child: GridView.builder(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount:
                images.length, //보여줄 item 개수. images 리스트 변수에 담겨있는 사진 수 만큼.
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //1 개의 행에 보여줄 사진 개수
              childAspectRatio: 1 / 1, //사진 의 가로 세로의 비율
              mainAxisSpacing: 10, //수평 Padding
              crossAxisSpacing: 10, //수직 Padding
            ),
            itemBuilder: (BuildContext context, int index) {
              // 사진 오른 쪽 위 삭제 버튼을 표시하기 위해 Stack을 사용함
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.cover, //사진을 크기를 상자 크기에 맞게 조절
                            image: FileImage(File(images[index]!
                                    .path // images 리스트 변수 안에 있는 사진들을 순서대로 표시함
                                )))),
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            //삭제 버튼
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: const Icon(Icons.close,
                                  color: Colors.white, size: 15),
                              onPressed: () {
                                //버튼을 누르면 해당 이미지가 삭제됨
                                setState(() {
                                  images.remove(images[index]);
                                });
                              },
                            )),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    ));
  }
}
