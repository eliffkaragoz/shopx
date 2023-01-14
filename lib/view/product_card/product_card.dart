import 'package:flutter/material.dart';
import 'package:task/view/common_widgets/custom_card.dart';
import 'package:task/core/constants/color_constant.dart';
import 'package:task/core/data/model/product.dart';
import 'package:kartal/kartal.dart';
import 'package:task/view/product_card/product_card.widgets.dart';

class ProductCard extends StatelessWidget with ProductCardWidgets {
  const ProductCard({
    super.key,
    required this.product,
    required this.count,
  });

  final ProductDatum product;
  final int count;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: ColorConstant.instance.light,
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: nameAndCategoryInformation(product, context),
            ),
            Expanded(
              flex: 3,
              child: countButtonAndPrice(count, product),
            ),
          ],
        ),
      ),
    );
  }
}
