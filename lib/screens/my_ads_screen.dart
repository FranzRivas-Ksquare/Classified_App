import 'package:flutter/material.dart';

class MyAdds extends StatelessWidget {
  MyAdds({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: ((context, index) {
            return const ProductCard();
          })
      ),
    );
  }

}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/products/switch.jpg'),
          Column(
            children: const <Widget>[
              Text('Here would be the product name'),
              Text('Here would be the post time'),
              Text('Here would be the product price'),
            ],
          ),
        ]
      )
    );
  }
}