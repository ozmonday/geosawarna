import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String title;

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    RouteSettings settings = ModalRoute.of(context).settings;
    title = settings.arguments;
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
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.30),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 250, 250, 0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 20, bottom: 20, left: 18, right: 16),
                          child: Image.asset("assets/left-arrow.png"),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                    ]),
                  ),
                ),
                Container(
                  width: _width,
                  height: _height * 0.89,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.30),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(12),
                    //padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 250, 250, 0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/20201222_082847.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            height: _height * 0.35,
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 3, left: 14, right: 14),
                              child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
