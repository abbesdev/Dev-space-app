import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullPhotoPage extends StatelessWidget {
  final String url;

  FullPhotoPage({Key? key, required this.url}) : super(key: key);
  static const appTitle = "Flutter Chat Demo";
  static const loginTitle = "Login";
  static const homeTitle = "Home";
  static const settingsTitle = "Settings";
  static const fullPhotoTitle = "Full Photo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          fullPhotoTitle,
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(url),
        ),
      ),
    );
  }
}
