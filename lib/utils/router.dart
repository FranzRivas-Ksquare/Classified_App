import 'package:flutter/material.dart';
// Routes
import 'package:classified_app/ui/screens/login_screen.dart';
import 'package:classified_app/ui/screens/register_screen.dart';
import 'package:classified_app/ui/screens/home_screen.dart';
import 'package:classified_app/ui/screens/settings_screen.dart';
import 'package:classified_app/ui/screens/edit_profile_screen.dart';
import 'package:classified_app/ui/screens/my_ads_screen.dart';
import 'package:classified_app/ui/screens/edit_ad_screen.dart';
import 'package:classified_app/ui/screens/product_detail_screen.dart';
import 'package:classified_app/ui/screens/create_ad_screen.dart';
import 'package:classified_app/ui/screens/image_viewer_screen.dart';

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
        return MaterialPageRoute(builder: (context) => HomeScreen(data: args));
      case '/settings':
        return MaterialPageRoute(builder: (context) => const SettingScreen());
      case '/product_details':
        return MaterialPageRoute(builder: (context) => ProductDetail(data: args));
      case '/image_viewer':
        return MaterialPageRoute(builder: (context) => ImageViewer(data: args));
      case '/create_add':
        return MaterialPageRoute(builder: (context) => const CreateAd());
      case '/edit_profile':
        return MaterialPageRoute(builder: (context) => EditProfile(data: args));
      case '/my_adds':
        return MaterialPageRoute(builder: (context) => const MyAdds());
      case '/edit_add':
        return MaterialPageRoute(builder: (context) => EditAd(data: args));
    }
  });
}