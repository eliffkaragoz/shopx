import 'package:flutter/material.dart';
import 'package:task/core/constants/color_constant.dart';

class MyElevatedButtonTheme {
  static ElevatedButtonThemeData elevatedButtonTheme(BuildContext context) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstant.instance.orange,
        foregroundColor: ColorConstant.instance.orange,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
      ),
    );
  }
}
