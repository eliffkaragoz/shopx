import 'package:flutter/material.dart';
import 'package:task/view/common_widgets/custom_app_bar.dart';
import 'package:task/view/common_widgets/custom_circular_progress_indicator.dart';
import 'package:task/core/data/service/product_service.dart';
import 'package:task/view/category_detail/category_detail.viewmodel.dart';
import 'package:task/view/product_card/product_card.dart';

class CategoryDetailWidgets {
  Widget buildProduct(CategoryDetailViewModel provider, int index) {
    return FutureBuilder(
      future: ProductService().getProductId(provider.productNameList[index]!),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        } else {
          var count =
              CategoryDetailViewModel().getProductCount(snapshot, context);
          return ProductCard(
            product: snapshot.data!,
            count: count,
          );
        }
      },
    );
  }

  CustomAppBar appBar(CategoryDetailViewModel provider) {
    return CustomAppBar(
      titleText: provider.categoryDetail.slug!,
    );
  }
}
