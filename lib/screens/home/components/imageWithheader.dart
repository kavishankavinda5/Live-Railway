import 'package:flutter/material.dart';

class ImagewithHeader extends StatelessWidget {
  const ImagewithHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 315,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/home_bg.png"),
            ),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 75, 73, 70).withOpacity(0.3),
                  Color.fromARGB(92, 6, 44, 59).withOpacity(0.3)
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Live Railway',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 4,
                      ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
