import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class Contact {
  final String name;
  final String phone;
  final LatLng latlng;
  
  Contact({@required this.name,@required this.phone, this.latlng});
}
