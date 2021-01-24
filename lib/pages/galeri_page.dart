import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Center(child: Text("Gallery Page"),)
      ),
    );
  }
}
