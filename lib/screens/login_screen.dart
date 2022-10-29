import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    var _formKey = GlobalKey<FormState>();

    TextEditingController _mailCtrl = TextEditingController();
    TextEditingController _passwordCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset('assets/images/craigslist_back.png'),
              Center(
                child: Image.asset('assets/images/craigslist_emblem.png'),
              ),
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
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
                ElevatedButton(onPressed: () {}, child: const Text('Login')),
                TextButton(onPressed: () {}, child: const Text('Don\'t have any account?')),
              ],
            ),
          )
        ],
      ),
    );
  }

}
