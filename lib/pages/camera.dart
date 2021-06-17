import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'dart:typed_data';

class CameraApp extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<CameraApp> {
  File? _image;
  final imagePicker = ImagePicker();

  // ture = カメラー　false = ライブラリー
  // ignore: unused_field
  bool _statusFlag = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('イメージ編集'),
          backgroundColor: Colors.orangeAccent,
          actions: [
            IconButton(
              icon: Icon(Icons.keyboard_return, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: Icon(Icons.add_task, size: 30),
              onPressed: () => {
                if (_statusFlag) {_saveImage()},
                Navigator.pop(context)
              },
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 400,
                    child: _image == null
                        ? Image.asset('assets/images/noimage.png')
                        : Image.file(_image!),
                  ),
                  SizedBox(height: 35),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            width: 170.0,
                            height: 60.0,
                            child: FloatingActionButton.extended(
                              onPressed: getImageFromCamera,
                              label: const Text(
                                'カメラ',
                                style: TextStyle(
                                  letterSpacing: 12,
                                  fontSize: 18.0,
                                ),
                              ),
                              icon: Icon(Icons.photo_camera, size: 40),
                              heroTag: null,
                              backgroundColor: Colors.orangeAccent.shade100,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                            width: 170.0,
                            height: 60.0,
                            child: FloatingActionButton.extended(
                              onPressed: getImageFromGarally,
                              label: const Text(
                                'ライブラリー',
                                style: TextStyle(
                                  letterSpacing: 0.5,
                                  fontSize: 18.0,
                                ),
                              ),
                              icon: Icon(Icons.photo_album, size: 40),
                              heroTag: null,
                              backgroundColor: Colors.orange,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  // カメラ画像の読み込み
  Future getImageFromCamera() async {
    // カメラ
    final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _statusFlag = true;
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        return;
      }
    });
  }

  // アルバム画像の読み込み
  Future getImageFromGarally() async {
    // アルバム
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _statusFlag = false;
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        return;
      }
    });
  }

  // 画像の保存
  Future _saveImage() async {
    if (_image != null) {
      Uint8List _buffer = await _image!.readAsBytes();
      await ImageGallerySaver.saveImage(_buffer);
    }
  }
}
