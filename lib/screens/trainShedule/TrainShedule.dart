import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;

class TrainShedule extends StatefulWidget {
  @override
  _TrainSheduleState createState() => _TrainSheduleState();
}

class _TrainSheduleState extends State<TrainShedule> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colots,
        title: Text('Train Shedule'),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('shedule').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: Color.fromARGB(255, 105, 103, 211),
                      title: Text(
                          style: TextStyle(
                            color: Color.fromARGB(255, 238, 242, 240),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          snapshot.data!.docs[index]['name'].toString()),
                      subtitle: Row(
                        children: [
                          Text('From -'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(snapshot.data!.docs[index]['from'].toString()),
                          SizedBox(
                            width: 20,
                          ),
                          Text('To -'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(snapshot.data!.docs[index]['to'].toString()),
                        ],
                      ),
                      trailing: IconButton(
                        color: Color.fromARGB(255, 238, 242, 240),
                        highlightColor: Color.fromARGB(255, 225, 236, 238),
                        icon: Icon(
                          Icons.train,
                        ),
                        onPressed: () {},
                      ),
                    );
                  });
            },
          )),
        ],
      ),
    );
  }
}
