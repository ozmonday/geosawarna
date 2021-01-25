import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
                height: _height * 0.14,
                decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.30),
                ),
                child: Container(
                  margin: EdgeInsets.only(left:12, right:12, top: 12),
                  decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Container(
                width: _width,
                height: _height * 0.86,
                decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.30),
                ),
                child: Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(10)),
                  child: 
                  Center(child: Text("About Page")))),
            ],
          )),
      ),
    );
  }
}
