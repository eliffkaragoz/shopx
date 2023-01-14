import 'package:flutter/material.dart';
import 'package:task/core/constants/color_constant.dart';

class MyAppBarTheme {
  static AppBarTheme appbarTheme() {
    return AppBarTheme(
      backgroundColor: ColorConstant.instance.light,
      elevation: 1,
      iconTheme: IconThemeData(
        color: ColorConstant.instance.dark,
        size: 20,
      ),
    );
  }
}
