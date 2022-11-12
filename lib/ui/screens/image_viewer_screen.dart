import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageViewer extends StatefulWidget {
  ImageViewer({super.key, required this.data});

  dynamic data;

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {

  @override
  Widget build(BuildContext context) {

    List gallery = widget.data['images'];

    return CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items: gallery.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.network(i),
            );
          },
        );
      }).toList(),
    );
  }
}