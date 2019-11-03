import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final vehiculesLocations = await locations.getVehicles();
    setState(() {
      _markers.clear();
      for (final vehicule in vehiculesLocations.vehicles) {
        final marker = Marker(
          markerId: MarkerId(vehicule.id),
          position: LatLng(vehicule.latitude, vehicule.longitude),
          infoWindow: InfoWindow(
            title: vehicule.name,
            snippet: vehicule.description,
          ),
        );
        _markers[vehicule.id] = marker;
      }
    });
  }


  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Circ Challenge'),
        backgroundColor: Colors.red[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: const LatLng(0, 0),
          zoom: 2,
        ),
        markers: _markers.values.toSet(),
      ),
    ),
  );

}