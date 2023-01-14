import 'package:flutter/material.dart';
import 'package:task/core/constants/color_constant.dart';

class MyInputTheme {
  static InputDecorationTheme inputTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: ColorConstant.instance.light,
      suffixIconColor: ColorConstant.instance.dark,
    );
  }
}
