import 'package:flutter/material.dart';

class ImgSelect extends StatelessWidget {
  const ImgSelect({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFF25723))
      ),
      child: Image.network(img, height: double.infinity, fit: BoxFit.fitHeight,),
    );
  }

}