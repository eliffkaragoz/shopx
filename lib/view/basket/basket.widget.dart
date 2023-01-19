import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task/core/l10n/app_l10n.dart';
import 'package:task/view/common_widgets/custom_auto_size_text.dart';
import 'package:task/core/constants/color_constant.dart';
import 'package:task/view/basket/basket.viewmodel.dart';
import 'package:task/view/basket/widgets/confirm_basket_button.dart';
import 'package:task/view/product_card/product_card.dart';

class BasketWidgets {
  Widget productList(BuildContext context, BasketViewModel provider) {
    return Padding(
      padding: context.paddingNormal,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: context.dynamicHeight(0.02),
          crossAxisSpacing: context.dynamicWidth(0.05),
        ),
        itemCount: provider.basketProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: provider.basketProducts[index]["product"],
            count: provider.basketProducts[index]["count"],
          );
        },
      ),
    );
  }

  Widget basketInformation(BuildContext context, BasketViewModel provider) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.instance.light,
        borderRadius: BorderRadius.only(
          topLeft: context.normalRadius,
          topRight: context.normalRadius,
        ),
      ),
      height: context.dynamicHeight(0.10),
      width: context.dynamicWidth(1),
      child: Padding(
        padding: context.paddingNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            totalPrice(provider, context),
            const ConfirmBasketButton(),
          ],
        ),
      ),
    );
  }

  Column totalPrice(BasketViewModel provider, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: L10n.of(context)!.total, fontSize: 14),
        CustomText(
          text: "${provider.basketTotalPrice(context)},00 ₺",
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ],
    );
  }
}
