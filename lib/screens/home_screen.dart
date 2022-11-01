import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List products = <Map>[
    {
      "name": 'Switch',
      "price": 500,
      "img": 'assets/images/products/switch.jpg'
    }
  ];

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
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductCard(
                name: products[index]['name'],
                price: products[index]['price'],
                img: products[index]['img']
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
  ProductCard({super.key, required this.name, required this.price, required this.img});

  final String name;
  final int price;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/product_details');
        },
        child: Expanded(
          child: Stack(
            children: [
              Image.asset(
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
      ),
    );
  }

}