import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task/view/common_widgets/custom_auto_size_text.dart';
import 'package:task/core/constants/color_constant.dart';
import 'package:task/core/data/enum/routes.enum.dart';
import 'package:task/core/init/routes/custom_navigator.dart';
import 'package:task/view/basket/basket.viewmodel.dart';

class BasketButton extends StatelessWidget {
  const BasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = BasketViewModel().of(context);

    return FloatingActionButton(
      child: Stack(
        children: [
          Transform(
            transform: Matrix4.translationValues(25, 35, 0),
            child: SizedBox(
              height: context.dynamicHeight(0.03),
              child: CircleAvatar(
                backgroundColor: ColorConstant.instance.orange,
                child: CustomText(
                  text: provider.basketProducts.length.toString(),
                  color: ColorConstant.instance.dark,
                ),
              ),
            ),
          ),
          const Center(
            child: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      onPressed: () {
        CustomNavigator.goToScreen(context, Routes.cart.name);
      },
    );
  }
}
