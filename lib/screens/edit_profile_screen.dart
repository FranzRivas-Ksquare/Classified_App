import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {

    var _formKey = GlobalKey<FormState>();

    TextEditingController _nameCtrl = TextEditingController();
    TextEditingController _mailCtrl = TextEditingController();
    TextEditingController _cellphoneCtrl = TextEditingController();

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
                          prefixIcon: Icon(Icons.account_box, color: Colors.white,)
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
                          prefixIcon: Icon(Icons.email, color: Colors.white,)
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
                          prefixIcon: Icon(Icons.phone, color: Colors.white,)
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: ElevatedButton(
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
                    child: const Text('Logout'),
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