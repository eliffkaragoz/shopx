import 'package:flutter/material.dart';
import 'package:task/view/common_widgets/custom_auto_size_text.dart';
import 'package:task/core/constants/color_constant.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.titleText,
    this.trailing,
  });

  final String? titleText;
  final Widget? trailing;
  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        trailing ?? const SizedBox(),
      ],
      title: Row(
        children: [
          CustomText(
            textAlign: TextAlign.center,
            text: titleText ?? '',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: ColorConstant.instance.dark,
          ),
        ],
      ),
    );
  }
}
