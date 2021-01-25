import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title; 
  const ListItem({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context,"/detail", arguments: title),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(children: <Widget>[
          Container(
            child: Text(title),
          )
        ]),
      ),
    );
  }
}
