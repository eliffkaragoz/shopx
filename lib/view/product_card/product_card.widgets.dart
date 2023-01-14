import 'package:flutter/material.dart';
import 'package:task/view/common_widgets/custom_auto_size_text.dart';
import 'package:task/view/common_widgets/custom_button_icon.dart';
import 'package:task/core/constants/color_constant.dart';
import 'package:task/core/data/model/product.dart';
import 'package:task/view/basket/basket.viewmodel.dart';
import 'package:task/view/product_card/widgets/count_card.dart';

import 'package:kartal/kartal.dart';

class ProductCardWidgets {
  CustomIconButton increseButton(BasketViewModel provider, product) {
    return CustomIconButton(
      onPressed: () {
        provider.increseProduct(product);
      },
      icon: Icons.remove,
    );
  }

  CustomIconButton incrementButton(BasketViewModel provider, product) {
    return CustomIconButton(
      onPressed: () {
        provider.incrementProduct(product);
      },
      icon: Icons.add,
    );
  }

  Widget nameAndCategoryInformation(
      ProductDatum product, BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(1),
      child: Wrap(
        runSpacing: 6,
        children: [
          CustomText(
            maxLines: 3,
            text: product.title!,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w500,
          ),
          CustomText(
            text: product.category!.name!,
            color: ColorConstant.instance.dark2,
            fontSize: 11,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }

  Widget countButtonAndPrice(count, product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: CountButton(
            count: count,
            product: product,
          ),
        ),
        Expanded(
          child: CustomText(
            text: "${product.price.toString()} ₺",
            color: ColorConstant.instance.brown,
          ),
        ),
      ],
    );
  }
}
