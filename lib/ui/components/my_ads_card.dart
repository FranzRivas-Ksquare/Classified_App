import 'package:flutter/material.dart';

class MyAdCard extends StatelessWidget {
  const MyAdCard({
    super.key,
    required this.product,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.mobile,
    required this.createdAt,
  });

  final int product;
  final String id;
  final String title;
  final String description;
  final num price;
  final List<String> images;
  final String mobile;
  final String createdAt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/edit_add', arguments: {
          'id': id,
          'images': images,
          'title': title,
          'price': price,
          'mobile': mobile,
          'description': description,
        });
      },
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF25723))
            ),
            child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 90,
                    height: 100,
                    child: Image.network(
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
                        }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title, style: TextStyle(fontSize: 15),),
                        const SizedBox(height: 1),
                        Text(createdAt, style: TextStyle(fontSize: 8),),
                        const SizedBox(height: 7),
                        Text('\$$price', style: TextStyle(fontSize: 11),),

                      ],
                    ),
                  ),
                ]
            ),
          )
      ),
    );
  }
}