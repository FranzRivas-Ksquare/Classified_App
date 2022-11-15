import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:classified_app/model/product_ad.model.dart';
import 'package:classified_app/services/auth.service.dart';
import '../utils/constants.dart';

class AdService {
  Future<List<ProductAd>> fetchAdsProducts() async {
    var url = Uri.parse("$apiUrl/ads");
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

  Future<List<ProductAd>> fetchMyAds() async {
    var storage = const FlutterSecureStorage();
    List<ProductAd> myAds = [];
    var url = Uri.parse("$apiUrl/ads/user");
    var token = await storage.read(key: 'token');
    kDebugFunc(token);
    // try {
    var resp = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    kDebugFunc(resp.statusCode);
    if (resp.statusCode == 401) {
      var isNewTokenGenerated = await AuthService().refreshToken();
      if (isNewTokenGenerated) {
        fetchMyAds();
      }
    }
    kDebugFunc(resp.body);
    var respJson = jsonDecode(resp.body);

    var myAdsData = respJson['data'];
    myAds =
        myAdsData.map<ProductAd>((myAd) => ProductAd.fromJson(myAd)).toList();

    return myAds;
  }



}