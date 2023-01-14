import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:task/core/constants/api_config.dart';
import 'package:task/core/data/model/one_product.dart';
import 'package:task/core/data/model/product.dart';
import 'package:task/core/base/base_service.dart';

class ProductService extends BaseService {
  Future<List<ProductDatum?>?> getProducts({String? query}) async {
    try {
      Response response = await dio!.get(ApiConfig.instance.productUrl);
      if (response.statusCode == 200) {
        Product productResponse = Product.fromJson(response.data);
        if (query != null) {
          var result = productResponse.data!
              .where((element) =>
                  element!.title!.toLowerCase().contains((query.toLowerCase())))
              .toList();
          return result;
        }
        return productResponse.data;
      } else {
        Logger().e("Error");
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<ProductDatum?> getProductId(String productName) async {
    try {
      Response response =
          await dio!.get("${ApiConfig.instance.productUrl}/$productName");

      if (response.statusCode == 200) {
        OneProduct categoryResponse = OneProduct.fromJson(response.data);
        return categoryResponse.data;
      } else {
        Logger().e("Error");
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }
}
