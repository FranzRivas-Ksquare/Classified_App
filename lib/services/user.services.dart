import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:classified_app/model/user.model.dart';
import 'package:classified_app/utils/constants.dart';
import 'package:classified_app/utils/alert_manager.dart';

class UserServices {
  Future<User> getUserInfo(context) async {
    var storage = const FlutterSecureStorage();
    var url = Uri.parse("$apiUrl/user/profile");
    var token = await storage.read(key: 'token');
    kDebugFunc(token);
    var resp = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
    var respJson = jsonDecode(resp.body);

    kDebugFunc(respJson);

    if (respJson['status'] == false) {
      AlertManager().displaySnackbar(context, respJson['message']);
    }

    var myUserData = await respJson['data'];
    User userInfo = User (
      name: myUserData['name'],
      email: myUserData['email'],
      mobile: myUserData['mobile'],
      image: myUserData['imgURL'],
    );

    kDebugFunc(userInfo.image);

    return userInfo;
  }

  void updateUserInfo(context, User user) async {
    var storage = const FlutterSecureStorage();
    var url = Uri.parse("$apiUrl/user");
    var token = await storage.read(key: 'token');
    var userObj = user.toJson();
    kDebugFunc(token);
    try {
      var resp = await http.patch(
          url,
          body: jsonEncode(userObj),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });

      var respJson = jsonDecode(resp.body);

      if (respJson['status'] == false) {
        AlertManager().displaySnackbar(context, respJson['message']);
      }

      if (respJson['status'] == true) {
        AlertManager().displaySnackbar(context, respJson['message']);
        Navigator.pushReplacementNamed(context, '/settings');
      }

      kDebugFunc(resp);
    } catch (e) {
      kDebugFunc(e);
    }

  }

}