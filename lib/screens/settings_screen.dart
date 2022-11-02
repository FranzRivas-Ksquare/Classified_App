import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  Map user = {
    'name': 'Evil Morty',
    'email': 'evil_morty@adultswim.com',
    'cellphone': '+1526966966969',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/avatar_morty.jpg'),
                ),
                const SizedBox(width: 17),
                SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(user['name'], style: TextStyle(fontSize: 15),),
                        const SizedBox(height: 5,),
                        Text(user['cellphone'], style: TextStyle(fontSize: 10),),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox(),),
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/edit_profile', arguments: {
                    'name': user['name'],
                    'email': user['email'],
                    'cellphone': user['cellphone'],
                  });
                }, child: const Text('Edit', style: TextStyle(color: Color(0xFFF25723)),))
              ],
            ),
            const SizedBox(height: 20),
            const UserData(
              iconConfig: Icon(Icons.add_business, color: Color(0xFFF25723),),
              route: '/my_adds',
              textConfig: 'My ads',
            ),
            const UserData(
              iconConfig: Icon(Icons.person, color: Color(0xFFF25723),),
              link: 'https://appmaking.com/about/',
              textConfig: 'About us',
            ),
            const UserData(
              iconConfig: Icon(Icons.contacts, color: Color(0xFFF25723),),
              link: 'https://appmaking.com/contact/',
              textConfig: 'Contact us',
            ),
          ],
        ),
      ),
    );
  }
}

class UserData extends StatelessWidget {
  const UserData(
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