import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Here would be the name of the product'),
            const Text('Here would be the name of the price'),
            const SizedBox(height: 15),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/image_viewer');
                },
                child: Image.asset('assets/images/products/switch.jpg')),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: const <Widget>[
                  Icon(Icons.person),
                  Text('Ali'),
                  SizedBox(width: 20),
                  Icon(Icons.timelapse),
                  Text('14 days ago'),
                ],
              ),
            ),
            Text('Descriptcion'),
            Expanded(child: SizedBox()),
            Container(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {

                  },
                child: const Text('Contact Seller'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}