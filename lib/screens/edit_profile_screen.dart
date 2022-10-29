import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    var _formKey = GlobalKey<FormState>();

    TextEditingController _nameCtrl = TextEditingController();
    TextEditingController _mailCtrl = TextEditingController();
    TextEditingController _cellphoneCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar_morty.jpg'),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameCtrl,
                  validator: (value) {
                    if(value!.isEmpty) {
                      return 'This is required';
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.account_box, color: Colors.white,)
                  ),
                ),
                TextFormField(
                  controller: _mailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'eMail',
                      prefixIcon: Icon(Icons.email, color: Colors.white,)
                  ),
                ),
                TextFormField(
                  controller: _cellphoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cellphone',
                      prefixIcon: Icon(Icons.phone, color: Colors.white,)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}