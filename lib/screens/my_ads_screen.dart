import 'package:flutter/material.dart';

class MyAdds extends StatelessWidget {
  const MyAdds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Adds'),
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/edit_add');
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
                  child: Image.asset(
                      'assets/images/products/switch.jpg',
                      height: double.infinity,
                      fit: BoxFit.fitHeight),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text('Switch for Sale'),
                    Text('18 days ago'),
                    Text('\$500'),
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