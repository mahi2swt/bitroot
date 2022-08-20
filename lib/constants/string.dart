import 'package:bitroot_org/constants/colors.dart';
import 'package:flutter/material.dart';

class Font {
  static const String light = "br-cobane-light";
  static const String extraLight = "br-cobane-extra-light";
  static const String thin = "br-cobane-thin";
  static const String regular = "br-cobane-regular";
  static const String medium = "br-cobane-medium";
  static const String semiBold = "br-cobane-semi-bold";
  static const String bold = "br-cobane-bold";
  static const String black = "br-cobane-black";
}

class Style {
  static TextStyle style(
    BuildContext? context, {
    Color? color = ColorsBase.black,
    String fontFamily = Font.regular,
    TextDecoration? textDecoration = TextDecoration.none,
    List<Shadow>? shadow,
    double height = 1,
    num? textSize = 8,
    double letterSpace = 0.0,
    Color? backgroundColor,
    Paint? foreground,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      color: foreground == null ? color : null,
      fontSize: textSize?.toDouble(),
      fontFamily: fontFamily,
      foreground: foreground,
      decoration: textDecoration,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpace,
      backgroundColor: backgroundColor,
      shadows: shadow,
    );
  }
}
