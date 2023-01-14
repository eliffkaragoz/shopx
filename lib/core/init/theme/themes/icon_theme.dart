import 'package:flutter/material.dart';
import 'package:task/core/constants/color_constant.dart';

class MyIconTheme {
  static IconThemeData iconTheme() {
    return IconThemeData(
      color: ColorConstant.instance.dark,
      size: 27,
    );
  }
}
