import 'dart:math';

import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        margin: const EdgeInsets.all(13),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar_morty.jpg'),
                ),
                Container(
                  color: Colors.pink,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text('Here would be the name'), // TODO: Grab name
                        Text('Here would be the cellphone'),
                      ],
                    ),
                  ),
                ),
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/edit_profile');
                }, child: const Text('Edit'))
              ],
            ),
            const UserData(iconConfig: Icon(Icons.add_business), route: '/my_adds', textConfig: 'My ads',),
            const UserData(iconConfig: Icon(Icons.person), route: 'pending', textConfig: 'About us',),
            const UserData(iconConfig: Icon(Icons.contacts), route: 'pending', textConfig: 'Contact us',),
          ],
        ),
      ),
    );
  }
}

class UserData extends StatelessWidget {
  const UserData({super.key, required this.iconConfig, required this.route, required this.textConfig});

  final Icon iconConfig;
  final String route;
  final String textConfig;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        iconConfig,
        const SizedBox(width: 20),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, route);
        }, child: Text(textConfig))
      ],
    );
  }

}