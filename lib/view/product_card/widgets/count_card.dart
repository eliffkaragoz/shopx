import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task/view/common_widgets/custom_auto_size_text.dart';
import 'package:task/view/common_widgets/custom_card.dart';
import 'package:task/core/data/model/product.dart';
import 'package:task/view/basket/basket.viewmodel.dart';
import 'package:task/view/product_card/product_card.widgets.dart';

class CountButton extends StatelessWidget with ProductCardWidgets {
  const CountButton({
    Key? key,
    required this.product,
    required this.count,
  }) : super(key: key);

  final ProductDatum product;
  final int count;

  @override
  Widget build(BuildContext context) {
    final provider = BasketViewModel().of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: FittedBox(
        child: AnimatedCrossFade(
          firstChild: CustomCard(
            child: incrementButton(provider, product),
          ),
          secondChild: CustomCard(
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                incrementButton(provider, product),
                CustomText(text: "$count"),
                provider.basketIsEmptyControl(provider, product).isEmpty
                    ? const SizedBox()
                    : increseButton(provider, product),
              ],
            ),
          ),
          crossFadeState:
              provider.basketIsEmptyControl(provider, product).isEmpty
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          duration: context.durationLow,
        ),
      ),
    );
  }
}
