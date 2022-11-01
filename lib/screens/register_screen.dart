import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var _formKey = GlobalKey<FormState>();

    TextEditingController _nameCtrl = TextEditingController();
    TextEditingController _mailCtrl = TextEditingController();
    TextEditingController _cellphoneCtrl = TextEditingController();
    TextEditingController _passwordCtrl = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Stack(
                children: <Widget>[
                  Image.asset('assets/images/craigslist_back.png', fit: BoxFit.fitWidth),
                  Center(
                    child: Container(
                      color: const Color(0x22000000),
                    ),
                  ),
                  Center(
                    child: Image.asset('assets/images/craigslist_emblem.png', scale: 17,),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TextFormField(
                        controller: _passwordCtrl,
                        obscureText: true,
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'This is required';
                          }
                          if (value.length < 10) {
                            return 'Password need to more than 9 char';
                          }
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.password, color: Colors.white,)
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, '/login');
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: const Text('Register Now'),
                      ),
                    ),
                    TextButton(onPressed: () {
                      Navigator.pop(context, '/login');
                    },
                      child: const Text('Already have an account?'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}