import 'package:flutter/material.dart';
import 'package:classified_app/model/user.model.dart';
import 'package:classified_app/services/auth.service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool _isLoading = false;

  switchSetLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {

    var _formKey = GlobalKey<FormState>();

    TextEditingController _nameCtrl = TextEditingController(text: "Franz");
    TextEditingController _emailCtrl = TextEditingController(text: "siniscotest+1@gmail.com");
    TextEditingController _cellphoneCtrl = TextEditingController(text: "696 696 6969");
    TextEditingController _passwordCtrl = TextEditingController(text: "1234");

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                              prefixIcon: Icon(Icons.account_box, color: Color(0xFFF25723),)
                          ),
                        ),
                      ),
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
                          controller: _cellphoneCtrl,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if(value!.isEmpty) {
                              return 'This is required';
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Cellphone',
                              prefixIcon: Icon(Icons.phone, color: Color(0xFFF25723),)
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
                                name: _nameCtrl.text,
                                email: _emailCtrl.text,
                                mobile: _cellphoneCtrl.text,
                                password: _passwordCtrl.text,
                              );

                              switchSetLoading();
                              AuthService().register(context, user).then((value) => value = switchSetLoading());
                            }
                          },
                          child: Visibility(
                            visible: _isLoading,
                            replacement: const Text('Register Now'),
                            child: const CircularProgressIndicator(color: Colors.white,),
                          ),
                        ),
                      ),
                      TextButton(onPressed: () {
                        Navigator.pop(context, '/login');
                      },
                        child: const Text('Already have an account?', style: TextStyle(color: Color(0xFFF25723)),),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}