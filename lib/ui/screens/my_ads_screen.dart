import 'package:flutter/material.dart';
import 'package:classified_app/ui/components/my_adds_card.dart';
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
            return MyAdCard(product: index);
          })
      ),
    );
  }

}