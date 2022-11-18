import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:classified_app/model/user.model.dart';
import 'package:classified_app/services/user.services.dart';
import 'package:classified_app/utils/constants.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key, required this.data});

  dynamic data;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

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

    TextEditingController _nameCtrl = TextEditingController(text: widget.data['name']);
    TextEditingController _mailCtrl = TextEditingController(text: widget.data['email']);
    TextEditingController _cellphoneCtrl = TextEditingController(text: widget.data['cellphone']);

    dynamic imageSelect(String imagePath) {
      if (imagePath.isEmpty) {
        return NetworkImage(widget.data['avatar']);
      } else {
        return FileImage(File(imagePath));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                captureImageFromGallery();
              },
              child: CircleAvatar(
                radius: 60,
                backgroundImage: imageSelect(_imagePath),
              ),
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
                          prefixIcon: Icon(Icons.account_box)
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
                          prefixIcon: Icon(Icons.email)
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
                          prefixIcon: Icon(Icons.phone)
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF25723)),
                      onPressed: () {
                        User updateUser = User(
                          name: _nameCtrl.text,
                          email: _mailCtrl.text,
                          mobile: _cellphoneCtrl.text,
                          image: _imageServerPath.isEmpty
                              ? 'https://picsum.photos/200'
                              : _imageServerPath,
                        );

                        kDebugFunc(updateUser);

                        UserServices().updateUserInfo(context, updateUser);
                      },
                      child: const Text('Update Profile'),
                    ),
                  ),
                  TextButton(onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                    child: const Text('Logout', style: TextStyle(color: Color(0xFFF25723)),),
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