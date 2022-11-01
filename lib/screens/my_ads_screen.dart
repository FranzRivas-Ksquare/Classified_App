import 'package:flutter/material.dart';
import 'package:classified_app/data/data_products.dart';

class MyAdds extends StatelessWidget {
  const MyAdds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Adds'),
      ),
      body: ListView.builder(
          itemCount: ads.length,
          itemBuilder: ((context, index) {
            return ProductCard(product: index);
          })
      ),
    );
  }

}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

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
              border: Border.all(color: Colors.blueAccent)
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(ads[product]['title']),
                    Text(ads[product]['createdAt']),
                    Text('\$${ads[product]['price']}'),

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