import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class Localisation extends StatefulWidget {
  Localisation({Key? key}) : super(key: key);

  @override
  State<Localisation> createState() => _LocalisationState();
}

class _LocalisationState extends State<Localisation> {
  late GoogleMapController mapController;
  List<Marker> _markers = [];
  bool showmaps = true;
  @override
  void initState() {
    super.initState();
    _markers.add(Marker(
      markerId: MarkerId("Emsi"),
      position: LatLng(33.583443, -7.642486),
    ));
    if (_markers.isNotEmpty) {
      setState(() {
        showmaps = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(0.2),
            child: showmaps
                ? Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: GoogleMap(
                      onMapCreated: (controller) {
                        setState(() {
                          mapController = controller;
                        });
                      },
                      markers: Set<Marker>.of(_markers),
                      mapType: MapType.hybrid,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(33.583443, -7.642486),
                          zoom: 19.151926040649414),
                    ),
                  )
                : CircularProgressIndicator(
                    color: Colors.blue,
                  )));
  }
}
