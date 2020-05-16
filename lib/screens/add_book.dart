import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/text_tracker_app_bar.dart';

class AddBookScreen extends StatefulWidget {
  static const String routeName = '/add_book';

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  File _image;
  final _formKey = GlobalKey<FormState>();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextTrackerAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            Column(
              children: [
                GFButton(
                  color: Colors.black,
                  icon: Icon(Icons.camera, color: Colors.white),
                  onPressed: getImage,
                  text: "Upload Book Cover (Either image or URL)",
                ),
                Container(
                  height: 25,
                  child: Text(
                    'OR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 40,
                  child: TextField(
                    readOnly: _image != null,
                    decoration: InputDecoration(
                      labelText: 'Image URL',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: _image == null
                      ? Center(child: Text('No image selected.'))
                      : Image.file(_image),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _createTextField(
                        context,
                        label: 'Book Title',
                        errorMessage: 'Please enter the book title.',
                      ),
                      _createTextField(
                        context,
                        label: 'Author (Full Name)',
                        errorMessage: "Please enter the author's name.",
                      ),
                      _createTextField(
                        context,
                        label: 'Book URL',
                        errorMessage:
                            "Please enter a URL where this book is accessible.",
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {}
                          },
                          child: Text('Submit Book!'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _createTextField(BuildContext context,
      {String label, String errorMessage}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }
}
