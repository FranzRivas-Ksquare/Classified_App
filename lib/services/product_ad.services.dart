import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:classified_app/model/product_ad.model.dart';
import 'package:classified_app/services/auth.service.dart';
import 'package:classified_app/utils/constants.dart';
import 'package:classified_app/utils/alert_manager.dart';

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

      kDebugFunc("$productsAds");


      return productsAds;
    } catch (e) {

      kDebugFunc("Error $e");

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
    kDebugFunc(myAds);

    return myAds;
  }

  void postAd(context, ProductAd newAd) async {
    var storage = const FlutterSecureStorage();
    var url = Uri.parse("$apiUrl/ads");
    var newAdObj = newAd.toJson();
    try {
      var token = await storage.read(key: 'token');
      kDebugFunc(token);
      var resp = await http.post(
        url,
        body: jsonEncode(newAdObj),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      kDebugFunc(resp.statusCode);
      if (resp.statusCode == 401) {
        var isNewTokenGenerated = await AuthService().refreshToken();
        if (isNewTokenGenerated) {
          postAd(context, newAd);
        }
        Navigator.pop(context);
      }
    } catch (e) {
      kDebugFunc(e);
      AlertManager().displaySnackbar(context, newAdObj['message']);
    }
  }
}