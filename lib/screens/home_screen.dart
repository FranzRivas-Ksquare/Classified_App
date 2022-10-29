import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar_morty.jpg'),
          )
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
          itemCount: 24,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(), // TODO: Square widgets for products
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // TODO: navigate to CreateToNewAddScreen
        tooltip: 'Add Product',
        child: const Icon(Icons.add),
      ),
    );
  }
}