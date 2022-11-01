import 'package:flutter/material.dart';

class EditAd extends StatelessWidget {
  EditAd({super.key});

  @override
  Widget build(BuildContext context) {

    var _formKey = GlobalKey<FormState>();

    TextEditingController _titleCtrl = TextEditingController();
    TextEditingController _priceCtrl = TextEditingController();
    TextEditingController _cellphoneCtrl = TextEditingController();
    TextEditingController _descriptionCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Ad'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: OutlinedButton(
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.photo_camera),
                    Text('Upload Photo', textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: TextFormField(
                controller: _titleCtrl,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'This is required';
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    prefixIcon: Icon(Icons.title, color: Colors.white,)
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: TextFormField(
                controller: _priceCtrl,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'This is required';
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                    prefixIcon: Icon(Icons.price_change, color: Colors.white,)
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
                    labelText: 'Contact',
                    prefixIcon: Icon(Icons.phone, color: Colors.white,)
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: TextFormField(
                controller: _descriptionCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    prefixIcon: Icon(Icons.description, color: Colors.white,)
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, '/home');
                },
                child: const Text('Submit Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }

}