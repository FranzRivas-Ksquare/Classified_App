import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.authorName,
    required this.mobile,
    required this.createdAt,
  });

  final int product;
  final String title;
  final String description;
  final num price;
  final List<String> images;
  final String authorName;
  final String mobile;
  final String createdAt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product_details', arguments: {
          'title': title,
          'description': description,
          'price': price,
          'images': images,
          'authorName': authorName,
          'mobile': mobile,
          'createdAt': createdAt,
        });
      },
      child: Expanded(
        child: Stack(
          children: [
            Image.network(
              images[0],
              height: double.infinity,
              fit: BoxFit.fitHeight,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.network(
                  'https://www.pindula.co.zw/images/a/a7/No_Image.jpg',
                  height: double.infinity,
                  fit: BoxFit.fitHeight,
                );
                },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 50,
                color: const Color(0x77000000),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 140,
                          height: 20,
                          child: Text(title, style: const TextStyle(fontSize: 13, color: Colors.white),
                          )
                      ),
                      const SizedBox(height: 1),
                      Text('\$$price', style: const TextStyle(fontSize: 11, color: Color(0xFFF25723)),)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}