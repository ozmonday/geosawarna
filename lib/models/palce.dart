import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class Place {
  final LatLng latLng;
  String pic;
  final String name;

  String desc;

  List<Widget> article;

  Place({@required this.latLng, @required this.name, this.desc, this.pic, this.article});
}
