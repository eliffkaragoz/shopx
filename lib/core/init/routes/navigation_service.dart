// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/cupertino.dart';
import 'package:task/core/base/base_navigation_service.dart';

class CustomNavigator implements INavigationService {
  static final CustomNavigator _instance = CustomNavigator._init();
  static CustomNavigator get instance => _instance;

  CustomNavigator._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<T?> navigateToPage<T extends Object?>(String path,
      {Object? data}) async {
    return await navigatorKey.currentState?.pushNamed(path, arguments: data);
  }

  @override
  Future<T?> navigateToPageClear<T extends Object?>(
      {required String path, Object? data}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
    return null;
  }
}
