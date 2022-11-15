import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:classified_app/model/product_ad.model.dart';
import 'package:classified_app/services/product_ad.services.dart';

class CreateAd extends StatefulWidget {
  const CreateAd({super.key});

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {

  String _imagePath = '';

  void captureImageFromGallery() async {
    var file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      print(file.path);
      setState(() {
        _imagePath = file.path;
        print("Error");
      });
    }
  }

  void captureImageFromCamera() async {
    print("Error");
    var file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file != null) {
      print(file.path);
      setState(() {
        _imagePath = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    var _formKey = GlobalKey<FormState>();

    TextEditingController _titleCtrl = TextEditingController();
    TextEditingController _priceCtrl = TextEditingController();
    TextEditingController _cellphoneCtrl = TextEditingController();
    TextEditingController _descriptionCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Ad'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              OutlinedButton(
                onPressed: () {
                  captureImageFromGallery();
                },
                child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _imagePath.isNotEmpty
                            ? Image.file(
                          File(_imagePath),
                          height: 90,
                          width: 90,
                        )
                            : const SizedBox(),
                        const Icon(Icons.photo_camera, color: Color(0xFFF25723),),
                        const Text(
                          'Upload Photo',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFFF25723)),
                        ),
                      ],
                    ),
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
                    if(_formKey.currentState!.validate()) {
                      ProductAd newAdPost = ProductAd(
                        title: _titleCtrl.text,
                        price: int.tryParse(_priceCtrl.text),
                        mobile: _cellphoneCtrl.text,
                        description: _descriptionCtrl.text,
                        images: [_imagePath], // TODO: use the correct service to upload with image_picker
                      );
                      AdService().postAd(context, newAdPost);
                    }
                  },
                  child: const Text('Submit Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}