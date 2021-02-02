import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geosawarna/widgets/marker_modal.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  CenterOnLocationUpdate _centerOnLocationUpdate;
  StreamController<double> _centerCurrentLocationStreamController;

  MapController _controller;

  @override
  void initState() {
    super.initState();
    _centerOnLocationUpdate = CenterOnLocationUpdate.never;
    _centerCurrentLocationStreamController = StreamController<double>();
  }

  @override
  void dispose() {
    _centerCurrentLocationStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    var markers = <Marker>[
      markerPlace(
          context, LatLng(-6.984163336984116, 106.30683775179502), _height),
      markerPlace(
          context, LatLng(-6.981437127253236, 106.30351181259377), _height),
      markerPlace(
          context, LatLng(-6.975239200630804, 106.29005785215917), _height),
      markerPlace(
          context, LatLng(-6.974941016529642, 106.29166717757914), _height),
    ];

    return SafeArea(
      child: Scaffold(
        body: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              width: _width,
              height: _height,
              child: FlutterMap(
                options: MapOptions(
                    center: LatLng(-6.977210, 106.296279),
                    zoom: 13.5,
                    onPositionChanged: (MapPosition position, bool hasGesture) {
                      if (hasGesture) {
                        setState(() => _centerOnLocationUpdate =
                            CenterOnLocationUpdate.never);
                      }
                    }),
                children: [
                  TileLayerWidget(
                    options: TileLayerOptions(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                      maxZoom: 19,
                    ),
                  ),
                  LocationMarkerLayerWidget(
                    plugin: LocationMarkerPlugin(
                      centerCurrentLocationStream:
                          _centerCurrentLocationStreamController.stream,
                      centerOnLocationUpdate: _centerOnLocationUpdate,
                    ),
                  ),
                  MarkerLayerWidget(
                    options: MarkerLayerOptions(markers: markers),
                  )
                ],
                mapController: _controller,
              ),
            ),
            Positioned(
              top: 14,
              right: 14,
              child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    // Automatically center the location marker on the map when location updated until user interact with the map.
                    setState(() => _centerOnLocationUpdate =
                        CenterOnLocationUpdate.always);
                    // Center the location marker on the map and zoom the map to level 18.
                    _centerCurrentLocationStreamController.add(18);
                  },
                  child: Icon(
                    Icons.my_location,
                    color: Colors.blue,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

Marker markerPlace(BuildContext context, LatLng point, double height) {
  return Marker(
    width: 30.0,
    height: 30.0,
    point: point, //LatLng(-6.977210, 106.296279),
    builder: (ctx) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              barrierColor: Colors.black26,
              context: context,
              builder: (context) {
                return MarkerModal();
              });
        },
        child: Image.asset("assets/star.png")),
  );
}
