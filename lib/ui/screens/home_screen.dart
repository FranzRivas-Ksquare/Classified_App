import 'package:flutter/material.dart';
import 'package:classified_app/ui/components/product_card.dart';
import 'package:classified_app/model/product_ad.model.dart';
import 'package:classified_app/services/product_ad.services.dart';


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
      body: FutureBuilder(
        future: AdService().fetchAdsProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductAd> productAds = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: productAds.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(
                    product: index,
                    title: productAds[index].title!,
                    description: productAds[index].description!,
                    price: productAds[index].price!,
                    images: productAds[index].images!,
                    authorName: productAds[index].authorName!,
                    mobile: productAds[index].mobile!,
                    createdAt: productAds[index].createdAt!,
                  ),
                );
              },
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFF25723),
        onPressed: () {
          Navigator.pushNamed(context, '/create_add');
        },
        tooltip: 'Add Product',
        child: const Icon(Icons.add),
      ),
    );
  }
}

