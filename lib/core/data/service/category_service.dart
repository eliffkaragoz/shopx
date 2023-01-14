import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:task/core/constants/api_config.dart';
import 'package:task/core/data/model/category.dart';
import 'package:task/core/base/base_service.dart';

class CategoryService extends BaseService {
  Future<List<CategoryDatum?>?> getCategories() async {
    try {
      Response response = await dio!.get(ApiConfig.instance.categoriesUrl);

      if (response.statusCode == 200) {
        Category categoryResponse = Category.fromJson(response.data);
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
