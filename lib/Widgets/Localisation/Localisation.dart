import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Localisation extends StatefulWidget {
  Localisation({Key? key}) : super(key: key);

  @override
  State<Localisation> createState() => _LocalisationState();
}

class _LocalisationState extends State<Localisation> {
  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(33.583443, -7.642486));
  Set<Marker> markers = {};
  Set<Circle> mycircles = Set.from([
    Circle(
        circleId: CircleId("myCircle"),
        center: LatLng(33.583443, -7.642486),
        radius: 500,
        fillColor: Color.fromARGB(160, 252, 3, 70),
        strokeColor: Color.fromARGB(126, 201, 7, 146),
        onTap: () {
          print('circle pressed');
        })
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Patient Localisation",
          style: TextStyle(
            color: Color.fromARGB(245, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(33.583443, -7.642486), zoom: 15.151926040649414),
        //markers: markers,
        circles: mycircles,
        zoomControlsEnabled: true,
        compassEnabled: true,
        mapType: MapType.hybrid,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 15,
        onPressed: () async {
          Position position = await _determinPosition();
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 15)));
          markers.clear();
          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude)));
          setState(() {});
        },
        label: Text("Current Location"),
        backgroundColor: Colors.redAccent,
        icon: Icon(Icons.location_history),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<Position> _determinPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Activer la localisation !');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Localisation refusé");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Veuillez Activer les parametres de localisation");
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
