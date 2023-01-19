import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task/core/l10n/app_l10n.dart';
import 'package:task/view/common_widgets/custom_auto_size_text.dart';
import 'package:task/core/constants/color_constant.dart';

class ConfirmBasketButton extends StatelessWidget {
  const ConfirmBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.6),
      child: ElevatedButton(
        onPressed: () {},
        child: CustomText(
          color: ColorConstant.instance.light,
          text: L10n.of(context)!.confirmBasket,
        ),
      ),
    );
  }
}
