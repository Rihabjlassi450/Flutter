import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatelessWidget {
  // Fixed coordinates for the marker
  static final LatLng _markerLocation = LatLng(34.747847, 10.766163);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
        backgroundColor: Color(0xFF1BBDB8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, "/home");
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _markerLocation,
                  zoom: 15,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId("marker_1"),
                    position: _markerLocation,
                    infoWindow: InfoWindow(
                      title: "Marker Title",
                      snippet: "Marker Description",
                    ),
                  ),
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                launchMapsUrl(_markerLocation.latitude, _markerLocation.longitude);
              },
              child: Text('Open Google Maps'),
            ),
          ],
        ),
      ),
    );
  }

  void launchMapsUrl(double latitude, double longitude) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
