import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class Livemap extends StatefulWidget {
  final String user_id;
  Livemap(this.user_id);
  @override
  _LivemapState createState() => _LivemapState();
}

class _LivemapState extends State<Livemap> {
  final loc.Location location = loc.Location();
  late GoogleMapController _controller;
  bool _added = false;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(devicePixelRatio: 5.2),
            "assets/icons/icon.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('location').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (_added) {
          livemap(snapshot);
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return GoogleMap(
          mapType: MapType.normal,
          markers: {
            Marker(
              position: LatLng(
                snapshot.data!.docs.singleWhere(
                    (element) => element.id == widget.user_id)['latitude'],
                snapshot.data!.docs.singleWhere(
                    (element) => element.id == widget.user_id)['longitude'],
              ),
              markerId: MarkerId('id'),
              icon: markerIcon,
              //icon: BitmapDescriptor.defaultMarkerWithHue(
              //BitmapDescriptor.hueMagenta)
            ),
          },
          initialCameraPosition: CameraPosition(
              target: LatLng(
                snapshot.data!.docs.singleWhere(
                    (element) => element.id == widget.user_id)['latitude'],
                snapshot.data!.docs.singleWhere(
                    (element) => element.id == widget.user_id)['longitude'],
              ),
              zoom: 14.2),
          onMapCreated: (GoogleMapController controller) async {
            setState(() {
              _controller = controller;
              _added = true;
            });
          },
        );
      },
    ));
  }

  Future<void> livemap(AsyncSnapshot<QuerySnapshot> snapshot) async {
    await _controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(
              snapshot.data!.docs.singleWhere(
                  (element) => element.id == widget.user_id)['latitude'],
              snapshot.data!.docs.singleWhere(
                  (element) => element.id == widget.user_id)['longitude'],
            ),
            zoom: 14.2)));
  }
}
