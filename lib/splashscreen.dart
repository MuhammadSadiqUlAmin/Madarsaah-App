
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:book_app/frontpageui.dart';





class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => frontpageui())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child:    Image(
          image: AssetImage('images/ss.png'),
      height: 400.0,
      width: 180.0,

    ),
      ),
    );
  }
}




