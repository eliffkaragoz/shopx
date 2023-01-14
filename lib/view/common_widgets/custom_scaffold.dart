import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task/view/basket/widgets/basket_button.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.drawer,
    this.appBarTitle,
  });
  final Widget body;
  final PreferredSizeWidget? appBar;
  final String? appBarTitle;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer,
        appBar: appBar,
        backgroundColor: backgroundColor,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: const BasketButton(),
        body: Center(
          child: Padding(
            padding: context.paddingNormal,
            child: body,
          ),
        ),
      ),
    );
  }
}
