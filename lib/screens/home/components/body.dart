import 'package:flutter/material.dart';
import 'package:live_railway/screens/home/components/imageWithheader.dart';
import 'package:live_railway/screens/livemap/livemapscreen.dart';

import '../../trainShedule/TrainShedule.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        ImagewithHeader(),
        LiveTrain(),
        TrainSchedule(),
      ],
    );
  }
}

class TrainSchedule extends StatelessWidget {
  const TrainSchedule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return TrainShedule();
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: 380,
        height: 166,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/beyond-meat-mcdonalds.png"),
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 15, 40, 88).withOpacity(0.7),
                Color.fromARGB(92, 80, 104, 213).withOpacity(0.7)
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Train Schedule',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 3.3,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LiveTrain extends StatelessWidget {
  const LiveTrain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Livemapscreen();
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 60),
        width: 380,
        height: 166,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/beyond-meat-mcdonalds.png"),
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 9, 77, 74).withOpacity(0.7),
                Color.fromARGB(92, 80, 213, 200).withOpacity(0.7)
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Live Train',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      height: 3.3,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
