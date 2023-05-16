import 'package:flutter/material.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.black54, Colors.black54],
        begin: Alignment.bottomCenter,
        end: Alignment.topRight,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Color.fromARGB(141, 0, 0, 0),
            ],
          ),
        ),
      ),
    );
  }
}
