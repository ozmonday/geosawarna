import 'package:flutter/material.dart';

class MarkerModal extends StatelessWidget {
  const MarkerModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
        Container(
          height: width * 0.3,
          width: width *0.3,
          decoration: BoxDecoration(
            image:  DecorationImage(
            image: AssetImage("assets/20201222_104731.jpg"), fit: BoxFit.cover)
          ),
        ),
        Flexible(
          child: Container(
              padding: EdgeInsets.only(left:12),
              height: width * 0.3,
              width: width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(child: Text("Pantai Tanjung Layar kjhuhukyutuytbutyubtyubtyubtuybtuyt", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis))
                ],
              ),
              ),
        )
      ]),
    );
  }
}
