import 'package:flutter/material.dart';
import 'package:classified_app/data/data_products.dart';

class MyAdCard extends StatelessWidget {
  const MyAdCard({super.key, required this.product});

  final int product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/edit_add', arguments: {
          'images': ads[product]['images'],
          'title': ads[product]['title'],
          'price': ads[product]['price'],
          'mobile': ads[product]['mobile'],
          'description': ads[product]['description'],
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
                        ads[product]['images'][0],
                        height: double.infinity,
                        fit: BoxFit.fitHeight),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(ads[product]['title'], style: TextStyle(fontSize: 15),),
                        const SizedBox(height: 1),
                        Text(ads[product]['createdAt'], style: TextStyle(fontSize: 8),),
                        const SizedBox(height: 7),
                        Text('\$${ads[product]['price']}', style: TextStyle(fontSize: 11),),

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