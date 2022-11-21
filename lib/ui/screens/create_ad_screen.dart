import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:classified_app/utils/constants.dart';
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

  bool _isLoading = false;

  switchSetLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  String _imagePath = '';
  String _imageServerPath = '';

  _upload(filePath) async {
    var url = Uri.parse("https://adlisting.herokuapp.com/upload/profile");
    var request = http.MultipartRequest('POST', url);
    http.MultipartFile image = await http.MultipartFile.fromPath('avatar', filePath);
    request.files.add(image);
    var response = await request.send();
    var resp = await response.stream.bytesToString();
    var respJson = jsonDecode(resp);
    setState(() {
      _imageServerPath = respJson['data']['path'];
    });
  }

  void captureImageFromGallery() async {
    var file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      kDebugFunc(file.path);
      setState(() {
        _imagePath = file.path;
      });
      _upload(file.path);
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
              Container(
                width: 130,
                height: 130,
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: OutlinedButton(
                  onPressed: () {
                    captureImageFromGallery();
                  },
                  child: _imagePath.isNotEmpty
                      ? Image.file(
                    File(_imagePath),
                    height: double.infinity,
                    fit: BoxFit.fitHeight,
                  )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.image, color: Color(0xFFF25723), size: 50,),
                      Text(
                        'Upload Image',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFFF25723)),
                      ),
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
                        price: num.tryParse(_priceCtrl.text) ?? 0,
                        mobile: _cellphoneCtrl.text,
                        description: _descriptionCtrl.text,
                        images: [_imageServerPath],
                      );
                      switchSetLoading();
                      AdService().postAd(context, newAdPost).then((value) => value = switchSetLoading());
                    }
                  },
                  child: Visibility(
                    visible: _isLoading,
                    replacement: const Text('Submit Add'),
                    child: const CircularProgressIndicator(color: Colors.white,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}