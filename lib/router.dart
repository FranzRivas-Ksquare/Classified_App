import 'package:flutter/material.dart';
// Routes
import 'package:classified_app/screens/login_screen.dart';
import 'package:classified_app/screens/register_screen.dart';
import 'package:classified_app/screens/home_screen.dart';
import 'package:classified_app/screens/settings_screen.dart';
import 'package:classified_app/screens/edit_profile_screen.dart';
import 'package:classified_app/screens/my_ads_screen.dart';
import 'package:classified_app/screens/edit_ad_screen.dart';
import 'package:classified_app/screens/product_detail_screen.dart';
import 'package:classified_app/screens/create_ad_screen.dart';
import 'package:classified_app/screens/image_viewer_screen.dart';

class RouteGenerator {
  var generate = ((settings) {
    var routeName = settings.name;
    var args = settings.arguments;
    switch(routeName) {
      case '/':
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case '/settings':
        return MaterialPageRoute(builder: (context) => const SettingScreen());
      case '/product_details':
        return MaterialPageRoute(builder: (context) => ProductDetail(data: args));
      case '/image_viewer':
        return MaterialPageRoute(builder: (context) => ImageViewer(data: args));
      case '/create_add':
        return MaterialPageRoute(builder: (context) => const CreateAd());
      case '/edit_profile':
        return MaterialPageRoute(builder: (context) => const EditProfile());
      case '/my_adds':
        return MaterialPageRoute(builder: (context) => const MyAdds());
      case '/edit_add':
        return MaterialPageRoute(builder: (context) => EditAd());
    }
    /*
        switch(routeName) {
          case '/home':
            return MaterialPageRoute(builder: (context) => const LoginScreen(title: 'Login', data: args));
        }
        */
  });
}