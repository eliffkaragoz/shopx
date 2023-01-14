import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task/view/drawer/drawer.widgets.dart';

class DrawerView extends StatelessWidget with DrawerWidgets {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.dynamicWidth(0.65),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          logo(context),
          categoryList(),
        ],
      ),
    );
  }
}
