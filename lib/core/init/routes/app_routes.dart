import 'package:flutter/cupertino.dart';
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
        return FadeTransitionPageRoute(const HomeView(),
            settings: routeSettings);

      case Routes.categoryDetail:
        return FadeTransitionPageRoute(const CategoryDetailView(),
            settings: routeSettings);

      case Routes.cart:
        return FadeTransitionPageRoute(const CartView(),
            settings: routeSettings);

      default:
        return MaterialPageRoute(
          builder: (context) => Text('No route defined for ${routes.name}'),
        );
    }
  }
}

class FadeTransitionPageRoute extends CupertinoPageRoute {
  final Widget widget;

  FadeTransitionPageRoute(this.widget, {RouteSettings? settings})
      : super(settings: settings, builder: (BuildContext context) => widget);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(opacity: animation, child: widget);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 650);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    Animation<double> onlyForwardAnimation;
    switch (animation.status) {
      case AnimationStatus.reverse:
      case AnimationStatus.dismissed:
        onlyForwardAnimation = kAlwaysCompleteAnimation;
        break;
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        onlyForwardAnimation = animation;
        break;
    }
    return theme.buildTransitions(
        this, context, onlyForwardAnimation, secondaryAnimation, child);
  }
}
