import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String route;
  final String picture;
  final String title;
  final Function routeFunc;
  const MenuButton({Key key, this.title, this.picture, this.route, this.routeFunc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white54,
      onTap: () => routeFunc(ctx: context, route: route),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 250, 250, 0.45),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(8),
                child: Image.asset(
                  picture,
                  width: 40,
                  color: Colors.white,
                )),
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        )),
      ),
    );
  }
}
