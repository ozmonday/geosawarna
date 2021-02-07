import 'package:flutter/material.dart';
import 'package:geosawarna/providers/places.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'dart:async';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:provider/provider.dart';

class Map extends StatefulWidget {
  Map({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen;
  double _panelHeightClosed = 90.0;

  PanelController pc = PanelController();
  CenterOnLocationUpdate _centerOnLocationUpdate;
  StreamController<double> _centerCurrentLocationStreamController;
  MapController _controller;

  @override
  void initState() {
    super.initState();
    //pc.hide();
    _centerOnLocationUpdate = CenterOnLocationUpdate.never;
    _centerCurrentLocationStreamController = StreamController<double>();
    _fabHeight = _initFabHeight;

    //SchedulerBinding.instance.addPostFrameCallback((_) => hidePanel(context));
  }

  void hidePanel(BuildContext ctx) {
    pc.hide();
  }

  // @override
  // void didUpdateWidget(covariant Map oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   pc.hide();
  // }

  @override
  void dispose() {
    _centerCurrentLocationStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .68;
    var currentplace = context.watch<PlacesProvider>().currentPlace;
    var markers = List<Marker>();
    var places = context.watch<PlacesProvider>().places;

    for (var i = 0; i < places.length; i++) {
      var mp = markerPlace(context, i, places[i].latLng, pc);
      markers.add(mp);
    }

    // places.asMap().entries.map((e) {

    //   var mp = markerPlace(context, e.key, e.value.latLng, pc);
    //   markers.add(mp);
    // });

    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SlidingUpPanel(
              panel: _panel(context),
              collapsed: currentplace == null ?  _title("unkown") : _title(currentplace.name),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14), topRight: Radius.circular(14)),
              controller: pc,
              maxHeight: _panelHeightOpen,
              minHeight: currentplace == null ? 0 : _panelHeightClosed,
              parallaxEnabled: true,
              parallaxOffset: .5,
              onPanelSlide: (double pos) => setState(() {
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                    _initFabHeight;
              }),
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
                    setState(() => _centerOnLocationUpdate =
                        CenterOnLocationUpdate.always);
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
      ),
    );
  }
}

Marker markerPlace(BuildContext ctx, int id, LatLng point, PanelController pc) {
  return Marker(
    width: 30.0,
    height: 30.0,
    point: point, //LatLng(-6.977210, 106.296279),
    builder: (BuildContext ctx) => GestureDetector(
        onTap: () {
          //pc.hide();
          ctx.read<PlacesProvider>().setCurrent(id);
          pc.show();
        },
        child: Image.asset("assets/star.png")),
  );
}

Widget _panel(BuildContext context) {
  var place = context.watch<PlacesProvider>().currentPlace;
  double _height = MediaQuery.of(context).size.height;
  return Container(
    margin: EdgeInsets.only(top: 18, left: 14, right: 14, bottom: 14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Flexible(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black12),
                    height: _height * 0.32),
                //Container(
                //   child: Text(
                //     "Deskripsi :",
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                //   padding: EdgeInsets.only(top: 8, bottom: 5),
                // ),
                Container(
                  child: Text(
                    place == null ? "tidak ada deskripsi": place.desc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(12),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {},
              child: Text("Petunjuk Jalan"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            FlatButton(
                padding: EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.circular(4)),
                textColor: Colors.blue,
                onPressed: () {},
                child: Text("Selengkapnya..."))
          ],
        ))
      ],
    ),
  );
}

Widget _title(String title) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14), topRight: Radius.circular(14)),
        color: Colors.white),
    child: Column(children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 14),
        height: 7,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.black26, borderRadius: BorderRadius.circular(16)),
      ),
      Flexible(
        child: Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(28, 24, 28, 0.8),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )),
      )
    ]),
  );
}
