import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:classified_app/model/user.model.dart';
import 'package:classified_app/utils/alert_manager.dart';
import 'package:classified_app/utils/constants.dart';

class AuthService {
  void register(context, User user) async {
    var url = Uri.parse("$apiUrl/auth/register");
    kDebugFunc(url);
    var userObj = user.toJson();
    try {
      var resp = await http.post(url, body: jsonEncode(userObj), headers: {
        'Content-Type': 'application/json',
      });

      kDebugFunc(resp.body);
      var respObj = jsonDecode(resp.body);

      if (respObj['status'] == false) {
        AlertManager().displaySnackbar(context, respObj['message']);
      }
      if (respObj['status'] == true) {
        AlertManager().displaySnackbar(context, respObj['message']);
        Navigator.pop(context, '/login');
      }

    } catch (e) {
      kDebugFunc(e);
    }
  }

  void login(context, User user) async {
    var storage = const FlutterSecureStorage();
    var url = Uri.parse("$apiUrl/auth/login");
    kDebugFunc(url);
    var userObj = user.toJson();
    try {
      var resp = await http.post(url, body: jsonEncode(userObj), headers: {
        'Content-Type': 'application/json',
      });
      var respObj = jsonDecode(resp.body);
      kDebugFunc(respObj);
      if (respObj['status'] == false) {
        AlertManager().displaySnackbar(context, respObj['message']);
      }
      if (respObj['status'] == true) {
        storage.write(key: 'userId', value: respObj['data']['user']['_id']);
        storage.write(key: 'token', value: respObj['data']['token']);
        storage.write(
            key: 'refreshToken', value: respObj['data']['refreshToken']);
        Navigator.pushReplacementNamed(context, '/home', arguments: {
          'avatar': respObj['data']['user']['imgURL'],
        });
      }
    } catch (e) {
      kDebugFunc(e);
    }
  }
}