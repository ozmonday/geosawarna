import 'package:flutter/material.dart';
import 'package:geosawarna/providers/places.dart';
import './pages/detail_info_page.dart';
import './pages/galeri_page.dart';
import './pages/kontak_page.dart';
import './pages/list_page.dart';
import './pages/map_page.dart';
import './pages/credit_page.dart';
import './pages/about_page.dart';
import './pages/home_page.dart';
import './providers/contacts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlacesProvider()),
        ChangeNotifierProvider(create: (_) => ContactProvider(),)
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/home",
      routes: <String, WidgetBuilder>{
        "/about" : (context) => AboutPage(),
        "/credit" : (context) => CreditPage(),
        "/gallery" : (context) => GalleryPage(),
        "/home" : (context) => HomePage(),
        "/contact" : (context) => ContactPage(),
        "/list" : (context) => ListPage(),
        "/map" : (context) => Map(),
        "/detail" : (context) => DetailPage(),
      },
    );
  }
}


