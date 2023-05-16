import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live_railway/screens/livemap/components/livemap.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:live_railway/screens/livemap/components/controlmap.dart';

class Livemapscreen extends StatefulWidget {
  static int indexa = 0;
  @override
  _LivemapscreenState createState() => _LivemapscreenState();
}

class _LivemapscreenState extends State<Livemapscreen> {
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
        title: Text('Live Train'),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('location').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              Livemapscreen.indexa = index + 1;
                              return controlmap();
                            },
                          ),
                        );
                      },
                      tileColor: Color.fromARGB(255, 86, 176, 161),
                      title: Text(
                          style: TextStyle(
                            color: Color.fromARGB(255, 238, 242, 240),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          snapshot.data!.docs[index]['name'].toString()),
                      trailing: IconButton(
                        color: Color.fromARGB(255, 238, 242, 240),
                        highlightColor: Color.fromARGB(255, 225, 236, 238),
                        icon: Icon(
                          Icons.train,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Livemap(snapshot.data!.docs[index].id)));
                        },
                      ),
                    );
                  });
            },
          )),
        ],
      ),
    );
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
