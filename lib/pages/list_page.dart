import 'package:flutter/material.dart';
import 'package:geosawarna/widgets/list_item.dart';

class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return SafeArea(
          child: Scaffold(
        body: Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/20201222_082831.jpg"),
            fit: BoxFit.cover,
          ),
          ),
          child: Column(
            children: [
              Container(
                width: _width,
                height: _height * 0.11,
                decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.30),
                ),
                child: Container(
                  margin: EdgeInsets.only(left:12, right:12, top: 12),
                  decoration: BoxDecoration(color: Color.fromRGBO(255, 250, 250, 0.8), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.only(top:20, bottom:20, left:18, right: 16),
                            child: Image.asset("assets/left-arrow.png"),
                          ),
                      ),
                       Container(
                        padding: EdgeInsets.only(left:8),
                        child: Text("Informasi Geowisata", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                      ),
                    ]
                  ),
                ),
              ),
              Container(
                width: _width,
                height: _height * 0.89,
                decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.30),
                ),
                child: Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Color.fromRGBO(255, 250, 250, 0.8), borderRadius: BorderRadius.circular(10)),
                  child: ListView(
                    padding: EdgeInsets.only(top:7, bottom:7),
                    children: <Widget>[
                      ListItem(title: "Pantai Tanjung Layar"),
                      ListItem(title: "Karang Taraje"),
                      ListItem(title: "Pantai Legon Pari"),
                    ],
                  ),
                ),
              ),
            ],
          )),
      ),
    );
  }
}
