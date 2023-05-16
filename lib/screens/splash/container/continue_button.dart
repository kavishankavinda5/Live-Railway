import 'package:flutter/material.dart';
import 'package:live_railway/screens/constans.dart';
import 'package:live_railway/palatte.dart';
import 'package:live_railway/screens/home/home_screen.dart';

class ContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 725,
          width: 500,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryLightColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color.fromARGB(220, 255, 255, 255),
                      width: 2,
                      style: BorderStyle.solid))),
          child: Text(
            "GET STARTED".toUpperCase(),
            style: TextStyle(color: Color.fromARGB(221, 255, 255, 255)),
            textScaleFactor: 1.5,
          ),
        ),
      ],
    );
  }
}

class Text_Logo extends StatelessWidget {
  const Text_Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: Center(
                      child: Text(
                        'Live Railway',
                        style: kHeading,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
