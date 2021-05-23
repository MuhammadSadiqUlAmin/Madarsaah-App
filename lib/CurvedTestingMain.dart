import 'package:flutter/material.dart';

class CustomAppBar extends CustomClipper<Path> {
  @override


  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 90);
    path.quadraticBezierTo(
        size.width / 2 , size.height, size.width , size.height - 90);
    path.lineTo(size.width, -0);

    path.close();
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }



}