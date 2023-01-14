import 'package:flutter/material.dart';
import 'package:task/core/constants/color_constant.dart';

class MyCardTheme {
  static CardTheme cardTheme() {
    return CardTheme(
      color: ColorConstant.instance.light2,
      elevation: 1,
    );
  }
}
