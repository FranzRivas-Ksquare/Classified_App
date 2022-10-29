import 'package:flutter/material.dart';

class EditAd extends StatelessWidget {
  EditAd({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    var _formKey = GlobalKey<FormState>();

    TextEditingController _productName = TextEditingController();
    TextEditingController _productPrice = TextEditingController();
    TextEditingController _cellphone = TextEditingController();
    TextEditingController _productDescription = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Icon(Icons.camera),
                  Text('Tap to upload'),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: Image.asset('assets/images/products/switch.jpg'),
              ),
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(),
                TextFormField(),
                TextFormField(
                  controller: _cellphone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cellphone',
                      prefixIcon: Icon(Icons.phone, color: Colors.white,)
                  ),
                ),
                TextFormField(),
                Container(
                  width: 400,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: ElevatedButton(
                    child: const Text('Submit', style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20),
                    ),
                    onPressed: () {
                      if(_formKey.currentState!.validate()) {
                        print(_productName.text);
                        print(_productPrice.text);
                        print(_cellphone.text);
                        print(_productDescription.text);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}