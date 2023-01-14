import 'package:flutter/material.dart';

class ColorConstant {
  static final ColorConstant _instance = ColorConstant._init();
  static ColorConstant get instance => _instance;
  ColorConstant._init();

  Color dark = const Color(0xFF333C40);
  Color dark2 = const Color.fromARGB(255, 118, 117, 117);
  Color light = const Color(0xFFFFFFFF);
  Color light2 = const Color(0xFFEEEEEE);
  Color orange = const Color(0xFFEF722C);
  Color blue = const Color(0xFF2354CC);
  Color green = const Color(0xFF05A660);
  Color brown = const Color(0xFFA45C40);
  Color transparent = Colors.transparent;
}
