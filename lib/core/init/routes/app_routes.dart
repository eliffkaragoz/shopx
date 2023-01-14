import 'package:flutter/material.dart';
import 'package:task/core/data/enum/routes.enum.dart';

import 'package:task/view/basket/basket.view.dart';
import 'package:task/view/category_detail/category_detail.view.dart';
import 'package:task/view/home/home.view.dart';

class AppRoutes {
  AppRoutes._init();
  static final AppRoutes _instance = AppRoutes._init();
  static AppRoutes get instance => _instance;

  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    final routes = Routes.values.byName(routeSettings.name!);

    switch (routes) {
      case Routes.home:
        return navigate(const HomeView());

      case Routes.categoryDetail:
        return navigate(const CategoryDetailView());

      case Routes.cart:
        return navigate(const CartView());

      default:
        return navigate(
          Text('No route defined for ${routes.name}'),
        );
    }
  }

  Route<dynamic> navigate(Widget child) {
    return MaterialPageRoute(
      builder: (context) {
        return child;
      },
    );
  }
}
