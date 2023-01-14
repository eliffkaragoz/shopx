import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task/view/common_widgets/custom_auto_size_text.dart';
import 'package:task/core/constants/color_constant.dart';

class EmptyBasket extends StatelessWidget {
  const EmptyBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart_checkout_rounded,
            size: 80,
          ),
          context.emptySizedHeightBoxLow3x,
          CustomText(
            text: "No added product yet ",
            color: ColorConstant.instance.dark2,
            fontSize: 18,
          ),
          context.emptySizedHeightBoxLow,
          CustomText(
            text: "Open polls will appear here",
            fontSize: 18,
            color: ColorConstant.instance.dark2,
          ),
        ],
      ),
    );
  }
}
