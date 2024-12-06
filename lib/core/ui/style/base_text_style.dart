import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/core/ui/style/base_color.dart';

class BaseTextStyle {
  static String baseFont = "Inter";

  static TextStyle lable1({Color? color}) {
    return TextStyle(
      fontSize: 18,
      color: color ?? BaseColor.textPrimaryColor,
    );
  }

  static TextStyle body1({Color? color}) {
    return TextStyle(
      fontFamily: BaseTextStyle.baseFont,
      fontSize: 18,
      color: color ?? BaseColor.textPrimaryColor,
    );
  }
}
