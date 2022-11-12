import 'dart:convert';
import 'package:classified_app/model/product_ad.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart' as constants;

class AdService {
  Future<List<ProductAd>> fetchAdsProducts() async {
    var url = Uri.parse("${constants.apiUrl}/ads");
    List<ProductAd> productsAds = [];
    try {
      var res = await http.get(url);
      var resAsJSON = jsonDecode(res.body);
      var adsData = resAsJSON['data'];

      productsAds =
          adsData.map<ProductAd>((products) => ProductAd.fromJson(products)).toList();

      if (kDebugMode) {
        print("$productsAds");
      }

      return productsAds;
    } catch (e) {
      if (kDebugMode) {
        print("Error $e");
      }
      return productsAds;
    }
  }
}