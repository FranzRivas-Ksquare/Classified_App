import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar_morty.jpg'),
              ),
              Column(
                children: <Widget>[
                  const Text('Here would be the name'), // TODO: Grab name
                  const Text('Here would be the cellphone'),
                  const Expanded(child: SizedBox()),
                  TextButton(onPressed: () {}, child: const Text('edit'))
                ],
              )
            ],
          ),
          const UserData(iconConfig: Icon(Icons.add), route: 'pending', textConfig: 'My ads',),
          const UserData(iconConfig: Icon(Icons.add), route: 'pending', textConfig: 'About us',),
          const UserData(iconConfig: Icon(Icons.add), route: 'pending', textConfig: 'Contact us',),
        ],
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
        TextButton(onPressed: () {}, child: Text(textConfig))
      ],
    );
  }

}