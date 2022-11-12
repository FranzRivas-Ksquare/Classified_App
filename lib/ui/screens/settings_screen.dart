import 'package:flutter/material.dart';
import 'package:classified_app/ui/components/setting_info.dart';

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
            const SettingInfo(
              iconConfig: Icon(Icons.add_business, color: Color(0xFFF25723),),
              route: '/my_adds',
              textConfig: 'My ads',
            ),
            const SettingInfo(
              iconConfig: Icon(Icons.person, color: Color(0xFFF25723),),
              link: 'https://appmaking.com/about/',
              textConfig: 'About us',
            ),
            const SettingInfo(
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