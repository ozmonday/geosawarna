import 'package:flutter/material.dart';
import '../models/palce.dart';
class ListItem extends StatelessWidget {
  final Place place; 
  const ListItem({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context,"/detail", arguments: place),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(children: <Widget>[
          Container(
            child: Text(place.name)
          )
        ]),
      ),
    );
  }
}
