import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCaptureScreen extends StatefulWidget {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Reference _storage = FirebaseStorage.instance.ref();

  @override
  _ImageCaptureScreenState createState() => _ImageCaptureScreenState();
}

class _ImageCaptureScreenState extends State<ImageCaptureScreen> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      TaskSnapshot snapshot = await widget._storage.child('pictures/${DateTime.now()}.jpeg').putFile(_image);
      if(snapshot.state == TaskState.error) {
        print(">>> Something Went Wrong");
      } else {
        var url = await snapshot.ref.getDownloadURL();
        print(">>> Firebase Storage Url:" + url);
        widget._firestore.collection('Admin').doc('R3O90dppDKNscHP03s17')
          .update({ 'imagesUrl': FieldValue.arrayUnion([url]) });
      }
    } else {
      print('No image selected.');
    }
    setState(() {
    });
  }

  @override
  void initState() {
    widget._auth.signInWithEmailAndPassword(email: 'admin@gmail.com', password: '123456')
      .then((value) {
        print(">>> User Sign In" + value.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}