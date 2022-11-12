import 'package:flutter/material.dart';
import 'package:classified_app/ui/components/image_select.dart';

class EditAd extends StatefulWidget {
  EditAd({super.key, required this.data});

  dynamic data;

  @override
  State<EditAd> createState() => _EditAdState();
}

class _EditAdState extends State<EditAd> {
  @override
  Widget build(BuildContext context) {

    var _formKey = GlobalKey<FormState>();

    TextEditingController _titleCtrl = TextEditingController(text: widget.data['title']);
    TextEditingController _priceCtrl = TextEditingController(text: '${widget.data['price']}');
    TextEditingController _cellphoneCtrl = TextEditingController(text: widget.data['mobile']);
    TextEditingController _descriptionCtrl = TextEditingController(text: widget.data['description']);

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
                    Icon(Icons.photo_camera, color: Color(0xFFF25723),),
                    Text(
                      'Upload Photo',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFFF25723)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.data['images'].length,
                itemBuilder: ((context, index) {
                  return ImgSelect(img: widget.data['images'][index],);
                }),
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
                    prefixIcon: Icon(Icons.title, color: Color(0xFFF25723),)
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
                    prefixIcon: Icon(Icons.price_change, color: Color(0xFFF25723),)
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
                    prefixIcon: Icon(Icons.phone, color: Color(0xFFF25723),)
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: TextFormField(
                maxLines: 3,
                controller: _descriptionCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    prefixIcon: Icon(Icons.description, color: Color(0xFFF25723),)
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