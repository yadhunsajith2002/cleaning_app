import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cleaning_app/view/onboarding_screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 3500), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OnBoardingScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.2,
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://t4.ftcdn.net/jpg/02/22/07/49/360_F_222074985_CwcuLMkQ0NBU2Qv1lqHD5XpHYtkY8mAB.jpg",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(animatedTexts: [
                WavyAnimatedText(
                  speed: Duration(milliseconds: 200),
                  "i D U S T",
                  textStyle: GoogleFonts.poppins(
                      color: Colors.green,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
              ]),
              Flip(
                preferences: AnimationPreferences(
                  duration: Duration(milliseconds: 1000),
                ),
                child: Icon(
                  Icons.home_outlined,
                  size: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
