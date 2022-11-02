import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key, required this.data});

  dynamic data;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {

    var _formKey = GlobalKey<FormState>();

    TextEditingController _nameCtrl = TextEditingController(text: widget.data['name']);
    TextEditingController _mailCtrl = TextEditingController(text: widget.data['email']);
    TextEditingController _cellphoneCtrl = TextEditingController(text: widget.data['cellphone']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/avatar_morty.jpg'),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: TextFormField(
                      controller: _nameCtrl,
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'This is required';
                        }
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.account_box)
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      controller: _mailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'eMail',
                          prefixIcon: Icon(Icons.email)
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      controller: _cellphoneCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Cellphone',
                          prefixIcon: Icon(Icons.phone)
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF25723)),
                      onPressed: () {
                        Navigator.pop(context, '/settings');
                      },
                      child: const Text('Update Profile'),
                    ),
                  ),
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/');
                  },
                    child: const Text('Logout', style: TextStyle(color: Color(0xFFF25723)),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}