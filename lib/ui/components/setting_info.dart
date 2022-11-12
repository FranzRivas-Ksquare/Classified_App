import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingInfo extends StatelessWidget {
  const SettingInfo(
      {
        super.key,
        required this.iconConfig,
        this.route,
        this.link,
        required this.textConfig
      });

  final Icon iconConfig;
  final String? route;
  final String? link;
  final String textConfig;

  _openURL(url) async {
    url = Uri.parse(url);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {

    String router = route ?? '';

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        iconConfig,
        const SizedBox(width: 20),
        TextButton(onPressed: (){
          if (router != '') {
            Navigator.pushNamed(context, router);
          }
          if(link != null) {
            _openURL(link);
          }
        }, child: Text(textConfig, style: TextStyle(color: Color(0xFFF25723)),))
      ],
    );
  }
}