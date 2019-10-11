import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_camera/custom_widgets/camera/camera.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CameraPage(),
    );
  }
}

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  dynamic _image;
  
  void openCamera(context) async {
    final image = await CustomCamera.openCamera();

    setState(() {
      _image = image;
    });
  }

  void openGallery(context) async {
    final image = await CustomCamera.openGallery();

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera example'),
      ),

      body: _image != null ? 
        Image.memory(
          _image,
          fit: BoxFit.fill,
        ) 
        : 
        null,

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () {
            return showDialog(context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: new SingleChildScrollView(
                    child: new ListBody(
                      children: <Widget>[
                        GestureDetector(
                          child: new Text('Tirar foto'),
                          onTap: () => openCamera(context),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                        ),
                        GestureDetector(
                          child: new Text('Selecionar da galeria'),
                          onTap: () => openGallery(context),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
      )
    );
  }
}
