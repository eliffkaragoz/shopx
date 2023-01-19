import 'package:flutter/material.dart';
import 'package:task/core/l10n/app_l10n.dart';
import 'package:task/view/common_widgets/custom_app_bar.dart';
import 'package:task/view/common_widgets/custom_grid_delegate.dart';
import 'package:task/view/basket/basket.viewmodel.dart';
import 'package:task/view/product_card/product_card.dart';

class HomeWidgets {
  PreferredSizeWidget appBar(BuildContext context) {
    return CustomAppBar(titleText: L10n.of(context)!.welcome);
  }

  Widget productList(BuildContext context, snapshot, BasketViewModel provider) {
    return Transform(
      transform: Matrix4.translationValues(0, 70, 0),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: CustomGridDelegate.gridDelegate(context),
        shrinkWrap: true,
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          int count = 0;
          for (var element in provider.basketProducts) {
            if (element["product"].id == snapshot.data![index]!.id) {
              count = element["count"];
            }
          }
          return ProductCard(
            product: snapshot.data![index]!,
            count: count,
          );
        },
      ),
    );
  }
}
