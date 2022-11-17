import 'package:flutter/material.dart';
import 'package:classified_app/ui/components/setting_info.dart';
import 'package:classified_app/model/user.model.dart';
import 'package:classified_app/services/user.services.dart';

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
            FutureBuilder(
              future: UserServices().getUserInfo(context),
              builder: (context, snapshot) {
                User myInfo = snapshot.data!;
                if (snapshot.hasData) {
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            myInfo.image!),
                      ),
                      const SizedBox(width: 17),
                      SizedBox(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                myInfo.name!,
                                style: TextStyle(fontSize: 15),),
                              const SizedBox(height: 5,),
                              Text(myInfo.mobile!,
                                style: TextStyle(fontSize: 10),),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox(),),
                      TextButton(onPressed: () {
                        Navigator.pushNamed(context, '/edit_profile',
                            arguments: {
                              'name': myInfo.name!,
                              'email': myInfo.email!,
                              'cellphone': myInfo.mobile!,
                              'avatar': myInfo.image!,
                            });
                      }, child: const Text('Edit', style: TextStyle(
                          color: Color(0xFFF25723)),))
                    ],
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
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