import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'package:flutter_map/flutter_map.dart' as flutter_map;

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  google_maps.GoogleMapController? mapController;
  google_maps.LatLng pickedLocation=google_maps.LatLng(22.1, 11.2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Map Picker'),
      ),
      body: google_maps.GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController=controller;
          });
        },
        initialCameraPosition: google_maps.CameraPosition(
          target: google_maps.LatLng(37.7749, -122.4194),
          zoom: 13.0,
        ),
        onTap: (google_maps.LatLng location) {
          setState(() {
            pickedLocation = location;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (pickedLocation != null) {
            // Handle the picked location
            print('Picked Location: $pickedLocation');
          } else {
            // Display a message indicating no location picked
            print('No location picked');
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
