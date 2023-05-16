import 'package:flutter/material.dart';
import 'package:live_railway/screens/splash/container/splash-body.dart';
import 'package:live_railway/screens/splash/container/continue_button.dart';
import 'package:live_railway/screens/splash/container/dot_indicators.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashBody(),
        WelcomeScreen1(),
        Text_Logo(),
        ContinueButton(),
      ],
    );
  }
}



   















































/*import 'package:flutter/material.dart';
import 'package:live_railway/palatte.dart';
import 'container/splash_screen.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashScreen(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    child: Center(
                      child: Text(
                        'Live Railway',
                        style: kHeading,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                          TextInput(),
                          TextInput(),
                        ],
                        ),
                      ],
                    ),

                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[600]?.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16)),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
*/