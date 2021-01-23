import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  final String title = "Home Screen";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incremetCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("tap treoss!"),
            Text('$_counter', style: Theme.of(context).textTheme.headline4,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incremetCounter,
        child: Icon(Icons.add),
        ),
    );
  }
}
