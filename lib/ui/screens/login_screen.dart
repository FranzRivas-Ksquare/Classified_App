import 'package:flutter/material.dart';
import 'package:classified_app/model/user.model.dart';
import 'package:classified_app/services/auth.service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var _formKey = GlobalKey<FormState>();

    TextEditingController _emailCtrl = TextEditingController(text: "siniscotest@gmail.com");
    TextEditingController _passwordCtrl = TextEditingController(text: "1234");

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
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'This is required';
                          }
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'eMail',
                            prefixIcon: Icon(Icons.email, color: Color(0xFFF25723),)
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
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.password, color: Color(0xFFF25723),)
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF25723)),
                          onPressed: () {
                            if(_formKey.currentState!.validate()) {
                              User user = User(
                                email: _emailCtrl.text,
                                password: _passwordCtrl.text,
                              );
                              AuthService().login(context, user);
                              Navigator.pushReplacementNamed(context, '/home');
                            }
                          },
                          child: const Text('Login'),
                      ),
                    ),
                    TextButton(onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                        child: const Text('Don\'t have any account?', style: TextStyle(color: Color(0xFFF25723)),),
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
