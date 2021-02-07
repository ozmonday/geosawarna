import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class Place {
  final LatLng latLng;
  List<String> pic;
  final String name;
  String desc;
  
  Place({@required this.latLng, @required this.name, this.desc, this.pic});
}
