import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: const <Widget>[
          Text('Here would be the name of the product'),
          Text('Here would be the name of the price'),

        ]

      ),
    );
  }
}