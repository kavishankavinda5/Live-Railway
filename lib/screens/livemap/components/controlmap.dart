import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live_railway/screens/livemap/livemapscreen.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class controlmap extends StatefulWidget {
  @override
  _controlmapState createState() => _controlmapState();
}

class _controlmapState extends State<controlmap> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    _requestPermission();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colots,
        title: Text(''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 50),
          TextButton(
              style: TextButton.styleFrom(
                  fixedSize: const Size(300, 80),
                  backgroundColor: Color.fromARGB(255, 82, 129, 168),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 24)),
              onPressed: () {
                _getLocation();
                _listenLocation();
              },
              child: Text('Enable live Train')),
          const SizedBox(height: 50),
          TextButton(
              style: TextButton.styleFrom(
                  fixedSize: const Size(300, 80),
                  backgroundColor: Color.fromARGB(255, 171, 83, 83),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 24)),
              onPressed: () {
                _stopListening();
              },
              child: Text('Stop live Train')),
        ],
      ),
    );
  }

  _getLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance
          .collection('location')
          .doc(Livemapscreen.indexa.toString())
          .set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance
          .collection('location')
          .doc(Livemapscreen.indexa.toString())
          .set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
      }, SetOptions(merge: true));
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
