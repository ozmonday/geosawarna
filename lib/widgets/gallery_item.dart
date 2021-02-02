import 'package:flutter/material.dart';

class GalleryItem extends StatelessWidget {
  final String imageDir;
  const GalleryItem({Key key, this.imageDir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black38),
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
            image: AssetImage(imageDir), fit: BoxFit.cover),
      ),
      height: _height * 0.3,
      //child: Text("This item"),
    );
  }
}
