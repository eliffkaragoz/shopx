import 'package:flutter/cupertino.dart';
import 'package:task/core/base/base_view_model.dart';
import 'package:task/core/data/model/product.dart';

class BasketViewModel extends IViewModel<BasketViewModel> {
  List<Map<String, dynamic>> basketProducts = [];

  void incrementProduct(ProductDatum product) {
    if (basketProducts.where((element) {
      return element["product"].id == product.id;
    }).isEmpty) {
      basketProducts.add({"product": product, "count": 1});
    } else {
      for (var element in basketProducts) {
        if (element["product"].id == product.id) {
          element["count"] = element["count"] + 1;
        }
      }
    }
    notifyListeners();
  }

  void increseProduct(ProductDatum product) {
    int? index;
    for (var item in basketProducts) {
      if (item["product"].id == product.id) {
        item["count"] = item["count"] - 1;
      }
      if (item["count"] == 0) {
        index = basketProducts.indexWhere(
            (element) => element["product"].id == item["product"].id);
      }
    }
    if (index != null) {
      basketProducts.removeAt(index);
    }
    notifyListeners();
  }

  Iterable<Map<String, dynamic>> basketIsEmptyControl(
      BasketViewModel provider, product) {
    return provider.basketProducts.where((element) {
      return element["product"].id == product.id;
    });
  }

  basketTotalPrice(BuildContext context) {
    final provider = BasketViewModel().of(context);
    List productPrice = [];
    for (var element in provider.basketProducts) {
      productPrice.add(element["product"].price * element["count"]);
    }
    int sum = 0;
    for (int element in productPrice) {
      sum += element;
    }
    return sum;
  }
}
