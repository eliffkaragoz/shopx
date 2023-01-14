import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:task/core/base/base_view_model.dart';
import 'package:task/core/data/model/category.dart';
import 'package:task/core/data/model/product.dart';
import 'package:task/core/data/service/product_service.dart';
import 'package:task/view/basket/basket.viewmodel.dart';

class CategoryDetailViewModel extends IViewModel<CategoryDetailViewModel> {
  CategoryDatum _categroyDetail = CategoryDatum();
  CategoryDatum get categoryDetail => _categroyDetail;

  set categoryDetail(CategoryDatum category) {
    _categroyDetail = category;
    notifyListeners();
  }

  final List<String?> _productNameList = [];
  List<String?> get productNameList => _productNameList;

  setProductNameList(String newList) {
    _productNameList.add(newList);
    notifyListeners();
  }

  buildProductNameList(context) {
    final provider = CategoryDetailViewModel().of(context, listen: false);
    List<String?>? productIdList = provider.categoryDetail.products;

    ProductService().getProducts().then((productList) {
      for (var element in productList!) {
        if (productIdList!.contains(element!.id)) {
          provider.setProductNameList(element.slug!);
        }
      }
    }).catchError((e) {
      Logger().e("Hata");
    });
  }

  getProductCount(AsyncSnapshot<ProductDatum?> snapshot, BuildContext context) {
    final providerCardView = BasketViewModel().of(context);
    int count = 0;
    for (var element in providerCardView.basketProducts) {
      if (element["product"].id == snapshot.data?.id) {
        count = element["count"];
      }
    }
    return count;
  }
}
