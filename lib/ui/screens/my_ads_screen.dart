import 'package:flutter/material.dart';
import 'package:classified_app/ui/components/my_ads_card.dart';
import 'package:classified_app/model/product_ad.model.dart';
import 'package:classified_app/services/product_ad.services.dart';

class MyAdds extends StatelessWidget {
  const MyAdds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Adds'),
      ),
      body: FutureBuilder(
        future: AdService().fetchMyAds(),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductAd> myProductsAds = snapshot.data!;
            return ListView.builder(
                itemCount: myProductsAds.length,
                itemBuilder: ((context, index) {
                  return MyAdCard(
                    product: index,
                    id: myProductsAds[index].sId!,
                    title: myProductsAds[index].title!,
                    description: myProductsAds[index].description!,
                    price: myProductsAds[index].price!,
                    images: myProductsAds[index].images!,
                    mobile: myProductsAds[index].mobile!,
                    createdAt: myProductsAds[index].createdAt!,
                  );
                })
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
    );
  }

}