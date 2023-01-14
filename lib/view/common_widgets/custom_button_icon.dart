import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor,
    this.iconSize,
    this.splashRadius,
    this.splashColor,
    this.highlightColor,
    this.tooltip,
    this.iconColor,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? splashColor;
  final Color? highlightColor;
  final double? iconSize;
  final double? splashRadius;
  final IconData icon;
  final String? tooltip;
  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip ?? "",
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: iconColor,
        size: 20,
      ),
      color: backgroundColor,
      iconSize: iconSize,
      splashColor: splashColor,
      highlightColor: highlightColor,
      splashRadius: splashRadius ?? context.normalRadius.x,
    );
  }
}
