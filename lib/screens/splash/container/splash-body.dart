import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  static int _sent_activeIndex() => activeIndex;
  //int sent_activeIndex(int index) => activeIndex = index;

  static int activeIndex = 0;

  final List<String> images = [
    'assets/images/splash_1.jpg',
    'assets/images/splash_2.jpg',
    'assets/images/splash_3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 1,
                viewportFraction: 1,
                autoPlay: true,
                //aspectRatio: 9 / 16,
                //height: 600,
                //enlargeCenterPage: true,

                onPageChanged: (index, reason) =>
                    setState(() => _SplashBodyState.activeIndex = index),
              ),
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                final image = images[index];
                return buildImage(image, index);
              },
            ),
          ],
        ),
      ),
    );
  }

//Splash Image Build
  Widget buildImage(String image, int index) => Container(
        //margin: EdgeInsets.symmetric(horizontal: 0),
        color: Colors.grey,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      );
}
