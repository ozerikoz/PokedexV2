import 'package:flutter/material.dart';

class Static {
  //fonts
  TextStyle fontStyleBold(double size, Color color) {
    return TextStyle(
      fontFamily: "Poppins",
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle fontStyleRegular(double size, Color color) {
    return TextStyle(
      fontFamily: "Poppins",
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle fontStyleLight(double size, Color color) {
    return TextStyle(
      fontFamily: "Poppins",
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle fontStyleThin(double size, Color color) {
    return TextStyle(
      fontFamily: "Poppins",
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w300,
    );
  }
}
