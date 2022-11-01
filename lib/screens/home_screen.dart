import 'package:flutter/material.dart';
import 'package:classified_app/data/data_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar_morty.jpg'),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemCount: ads.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductCard(
                  product: index,
                  name: ads[index]['title'],
                  price: ads[index]['price'],
                  img: ads[index]['images'][0]
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_add');
        },
        tooltip: 'Add Product',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product, required this.name, required this.price, required this.img});

  final int product;
  final String name;
  final int price;
  final String img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product_details', arguments: {
          'title': ads[product]['title'],
          'price': ads[product]['price'],
          'images': ads[product]['images'],
          'createdBy': ads[product]['createdBy'],
          'createdAt': ads[product]['createdAt'],
          'description': ads[product]['description'],
        });
      },
      child: Expanded(
        child: Stack(
          children: [
            Image.network(
              img,
              height: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 45,
                color: const Color(0x77000000),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name),
                      const SizedBox(height: 5),
                      Text('\$$price')
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