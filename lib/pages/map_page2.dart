import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'dart:async';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

class Map extends StatefulWidget {
  Map({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen;
  double _panelHeightClosed = 95.0;

  PanelController pc = PanelController();
  CenterOnLocationUpdate _centerOnLocationUpdate;
  StreamController<double> _centerCurrentLocationStreamController;
  MapController _controller;

  @override
  void initState() {
    super.initState();
    pc.hide();
    _centerOnLocationUpdate = CenterOnLocationUpdate.never;
    _centerCurrentLocationStreamController = StreamController<double>();

    _fabHeight = _initFabHeight;
  }

  @override
  void dispose() {
    _centerCurrentLocationStreamController.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    var markers = <Marker>[
    markerPlace(LatLng(-6.984163336984116, 106.30683775179502), pc),
    markerPlace(LatLng(-6.981437127253236, 106.30351181259377), pc),
    markerPlace(LatLng(-6.975239200630804, 106.29005785215917), pc),
    markerPlace(LatLng(-6.974941016529642, 106.29166717757914), pc),
    ];

    return Container(
      child: Stack(
        children: <Widget>[
          SlidingUpPanel(
            controller: pc,
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            panelBuilder: (sc) => _panel(sc, context),
            body: FlutterMap(
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
            right: 14,
            bottom: _fabHeight,
            child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  // Automatically center the location marker on the map when location updated until user interact with the map.
                  setState(() =>
                      _centerOnLocationUpdate = CenterOnLocationUpdate.always);
                  // Center the location marker on the map and zoom the map to level 18.
                  _centerCurrentLocationStreamController.add(18);
                },
                child: Icon(
                  Icons.my_location,
                  color: Colors.blue,
                )),
          ),
        ],
      ),
    );
  }
}

Marker markerPlace(LatLng point, PanelController pc) {
  return Marker(
    width: 30.0,
    height: 30.0,
    point: point, //LatLng(-6.977210, 106.296279),
    builder: (BuildContext ctx) => GestureDetector(
        onTap: () {
          pc.show();
        },
        child: Image.asset("assets/star.png")),
  );
}

Widget _panel(ScrollController sc, BuildContext ctx) {
  return MediaQuery.removePadding(
      context: ctx,
      removeTop: true,
      child: ListView(
        controller: sc,
        children: <Widget>[],
      ));
}
