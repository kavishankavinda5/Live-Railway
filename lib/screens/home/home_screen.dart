import 'package:flutter/material.dart';
import 'package:live_railway/screens/constans.dart';
import 'package:live_railway/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 24, 24),
      body: Body(),
      //extendBodyBehindAppBar: true,
      //appBar: buildAppBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: kIconColor,
        ),
        onPressed: () {},
      ),
    );
  }
}
