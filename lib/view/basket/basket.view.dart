import 'package:flutter/material.dart';
import 'package:task/core/l10n/app_l10n.dart';
import 'package:task/view/common_widgets/custom_app_bar.dart';
import 'package:task/view/basket/basket.viewmodel.dart';
import 'package:task/view/basket/basket.widget.dart';
import 'package:task/view/basket/widgets/empty_basket.dart';

class CartView extends StatelessWidget with BasketWidgets {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = BasketViewModel().of(context);

    return Scaffold(
      appBar: CustomAppBar(titleText: L10n.of(context)!.basket),
      body: provider.basketProducts.isEmpty
          ? const EmptyBasket()
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 8,
                  child: productList(context, provider),
                ),
                Expanded(
                  child: basketInformation(context, provider),
                ),
              ],
            ),
    );
  }
}
