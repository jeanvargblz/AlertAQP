import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapa_riesgos/categories.dart';
import 'package:mapa_riesgos/categories.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

BitmapDescriptor myIcon;

class MapSampleState extends State<MapSample> {
  List<Marker> allmarkers = [];

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-16.4063227, -71.5243637),
    zoom: 17.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-16.4063477, -71.5247956),
      tilt: 59.440717697143555,
      zoom: 21.151926040649414);

  @override
  Future<BitmapDescriptor> getBytesFromAsset(String path, int width) async {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(48, 48)),
            'assets/icons/asalto_ico.png')
        .then((onValue) {
      myIcon = onValue;
    });
    return myIcon;
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(48, 48)),
            'assets/icons/asalto_ico.png')
        .then((onValue) {
      myIcon = onValue;
    });

    allmarkers.add(Marker(
        markerId: MarkerId("robo"),
        draggable: false,
        position: LatLng(-16.4061227, -71.5243237),
        onTap: () {
          print('Marker type');
        }));

    allmarkers.add(Marker(
        markerId: MarkerId("asalto"),
        draggable: false,
        position: LatLng(-16.4068227, -71.5213237),
        onTap: () {
          print('Marker type');
        }));

    allmarkers.add(Marker(
        markerId: MarkerId("secuestro"),
        draggable: false,
        position: LatLng(-16.4067727, -71.5241237),
        onTap: () {
          print('Marker type');
        }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Mis alertas'),
              onTap: () {
                // Actualiza el estado de la aplicación
                // ...
                // Luego cierra el drawer
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => Category()),
                );
                ;
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set.from(allmarkers),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Alerta!'),
        icon: Icon(Icons.alarm),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
