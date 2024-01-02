import 'dart:async';

import 'package:deltainformatics/features/bottom_nav_bar/view/bottom_nav_bar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/keys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const BottomNavBarScreen(),
          ),
          (route) => false);
    });
    debugPrint("X---------------------------------");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return splashScreenUi();
  }


  Widget splashScreenUi(){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(64),
        child: Container(
          child: Image.asset("assets/images/logo_delta.png"),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
