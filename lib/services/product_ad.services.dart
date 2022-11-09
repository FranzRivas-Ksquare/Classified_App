import 'dart:convert';
import 'package:classified_app/model/product_ad.model.dart';
import 'package:http/http.dart' as http;
import 'constants.dart' as constants;

class AdService {
  Future<List<ProductAd>> fetchUserData() async {
    var url = Uri.parse(constants.apiUrl);
    List<ProductAd> productsAds = [];
    try {
      var res = await http.get(url);
      var resAsJSON = jsonDecode(res.body);
      var adsData = resAsJSON['data'];
      productsAds = adsData.map<ProductAd>((user) => ProductAd.fromJson(user)).toList();
      return productsAds;
    } catch (e) {
      print("Error $e");
      return productsAds;
    }
  }
}