import 'package:flutter/material.dart';
import 'package:geosawarna/widgets/menu_button.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  void routeTo({BuildContext ctx, String route}) {
    Navigator.pushNamed(ctx, route);
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return SafeArea(
      child: Scaffold(
          body: Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/20201222_082831.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 8),
              width: _width,
              height: _height * 0.2,
              decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.30)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Image.asset("assets/compass.png"),
                    Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)),
                        child: Image.asset("assets/logo.png")),
                  ]),
            ),
            Container(
              padding: EdgeInsets.zero,
              width: _width,
              height: _height * 0.8,
              decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.30)),
              child: GridView.count(
                padding:
                    EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 20),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                primary: false,
                children: <Widget>[
                  MenuButton(
                    title: "Tentng Sawarna",
                    picture: "assets/information-button.png",
                    route: "/about",
                    routeFunc: widget.routeTo,
                  ),
                  MenuButton(
                    title: "Kontak Sawarna",
                    picture: "assets/live-chat.png",
                    route: "/contact",
                    routeFunc: widget.routeTo,
                  ),
                  MenuButton(
                    title: "Peta Geowisata",
                    picture: "assets/map.png",
                    route: "/map",
                    routeFunc: widget.routeTo,
                  ),
                  MenuButton(
                    title: "Info Geowisata",
                    picture: "assets/search-location.png",
                    route: "/list",
                    routeFunc: widget.routeTo,
                  ),
                  MenuButton(
                    title: "Gallery",
                    picture: "assets/gallery.png",
                    route: "/gallery",
                    routeFunc: widget.routeTo,
                  ),
                  MenuButton(
                    title: "Credit",
                    picture: "assets/notes.png",
                    route: "/credit",
                    routeFunc: widget.routeTo,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
