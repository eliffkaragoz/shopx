import 'package:flutter/material.dart';
import 'package:task/core/constants/color_constant.dart';
import 'package:task/core/init/theme/themes/appbar_theme.dart';
import 'package:task/core/init/theme/themes/elevated_button_theme.dart';
import 'package:task/core/init/theme/themes/icon_theme.dart';
import 'package:task/core/init/theme/themes/input_theme.dart';
import 'themes/card_theme.dart';

class CustomTheme {
  static ThemeData customThemeData(BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: ColorConstant.instance.light2,
        useMaterial3: false,
        appBarTheme: MyAppBarTheme.appbarTheme(),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: ColorConstant.instance.dark),
        iconTheme: MyIconTheme.iconTheme(),
        cardTheme: MyCardTheme.cardTheme(),
        buttonTheme: ButtonThemeData(buttonColor: ColorConstant.instance.dark),
        inputDecorationTheme: MyInputTheme.inputTheme(),
        elevatedButtonTheme:
            MyElevatedButtonTheme.elevatedButtonTheme(context));
  }
}
