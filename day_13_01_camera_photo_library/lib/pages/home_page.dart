import 'dart:io';
import 'package:day_13_01_camera_photo_library/pages/camera_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double _screenWidth;
  String _imageFilePath;
  //Image.asset('images/metro.jpg')
  //Image.file(File(_imageFilePath)
  bool _toggleSwitchToChangeImageWithAnimation = false;

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _imageFilePath == null
                ? Image.asset('images/metro.jpg')
                : Image.file(File(_imageFilePath)),
            //buildAnimationCrossFadeWidget(),
            //buildAnimatedSwitcher(),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Click Me'),
              onPressed: () {
                //_showActionSheetOnClickMeButtonClicked(context);
                _showMaterialActionSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAnimationCrossFadeWidget() {
    return AnimatedCrossFade(
      duration: Duration(seconds: 1),
      firstChild: getImageBasedonImageFilePathStringWithoutSize(),
      secondChild: getImageBasedonImageFilePathStringWithoutSize(),
      crossFadeState: _toggleSwitchToChangeImageWithAnimation
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }

  Widget buildAnimatedSwitcher() {
    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      child: _toggleSwitchToChangeImageWithAnimation
          ? getImageBasedonImageFilePathStringWithFixedSize()
          : getImageBasedonImageFilePathStringWithFixedSize(),
    );
  }

  Widget getImageBasedonImageFilePathStringWithoutSize() {
    return _imageFilePath == null
        ? Image.asset('images/metro.jpg')
        : Image.file(File(_imageFilePath));
  }

  Widget getImageBasedonImageFilePathStringWithFixedSize() {
    return _imageFilePath == null
        ? Container(
            height: 200,
            width: _screenWidth,
            child: Image.asset('images/metro.jpg'))
        : Container(
            height: 200,
            width: _screenWidth,
            child: Image.file(File(_imageFilePath)));
  }

  void _showImagePicker() async {
    File selectedImageFile;

    try {
      selectedImageFile =
          await ImagePicker.pickImage(source: ImageSource.gallery);
    } catch (err) {
      print('ImagePicker.pickImage fails : $err');
      SnackBar snackBarr = SnackBar(
        content: Text('fails to open Gallary'),
      );
      _scaffoldKey.currentState.showSnackBar(snackBarr);
    }

    if (selectedImageFile != null) {
      setState(() {
        _toggleSwitchToChangeImageWithAnimation =
            !_toggleSwitchToChangeImageWithAnimation;
        _imageFilePath = selectedImageFile.path;
      });
    }
  }

  void _showCameraScreen() async {
    final cameras = await availableCameras();

    try {
      final camera = cameras.first;
      final result = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => CameraPage(camera: camera)));

      if (result != null) {
        setState(() {
          _imageFilePath = result;
        });
      }
    } catch (err) {
      print('availableCameras fails : $err');
      SnackBar snackBarr = SnackBar(
        content: Text('No camera found'),
      );
      _scaffoldKey.currentState.showSnackBar(snackBarr);
    }
  }

  void _showActionSheetOnClickMeButtonClicked(BuildContext context) {
    //showModalBottomSheet
    //showCupertinoModalPopup
    //DraggableScrollableSheet

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => actionSheetWidget(context),
    ).then((value) {
      print('cupertino action sheet : selected item : $value');
    });
  }

  Widget actionSheetWidget(BuildContext context) {
    return CupertinoActionSheet(
      title: Text('Select'),
      message: Text('select any one'),
      cancelButton: CupertinoActionSheetAction(
        child: Text('Cancel'),
        isDefaultAction: true,
        isDestructiveAction: true,
        onPressed: () {
          Navigator.pop(context, 'cancel btn clicked');
        },
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text('Open camera'),
          onPressed: () {
            Navigator.pop(context, 'camera btn clicked');
            _showCameraScreen();
          },
        ),
        CupertinoActionSheetAction(
          child: Text('Image Gallary'),
          onPressed: () {
            Navigator.pop(context, 'Image Gallary btn clicked');
            _showImagePicker();
          },
        ),
      ],
    );
  }

  void _showMaterialActionSheet(BuildContext context) {
    //showModalBottomSheet
    //showCupertinoModalPopup
    //DraggableScrollableSheet

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 150,
              child: Column(children: <Widget>[
                ListTile(
                    onTap: () {
                      Navigator.pop(context, 'Take a picture btn clicked');
                      _showCameraScreen();
                    },
                    leading: Icon(Icons.photo_camera),
                    title: Text("Take a picture from camera")),
                ListTile(
                    onTap: () {
                      Navigator.pop(context, 'photo library btn clicked');
                      _showImagePicker();
                    },
                    leading: Icon(Icons.photo_library),
                    title: Text("Choose from photo library"))
              ]));
        });
  }
}
