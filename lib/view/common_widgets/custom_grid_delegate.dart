import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomGridDelegate {
  static SliverGridDelegateWithFixedCrossAxisCount gridDelegate(
      BuildContext context) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: context.lowValue,
      crossAxisSpacing: context.lowValue,
    );
  }
}
