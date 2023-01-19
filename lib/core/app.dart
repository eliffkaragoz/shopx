import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:task/core/init/routes/navigation_service.dart';
import 'package:task/core/init/theme/custom_theme.dart';
import 'package:task/core/provider/multi_provider_init.dart';
import 'package:task/core/init/routes/app_routes.dart';
import 'package:task/view/splash/splash_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MultiProviderInit().providers,
      child: MaterialApp(
        onGenerateRoute: AppRoutes.instance.onGenerateRoute,
        navigatorKey: CustomNavigator.instance.navigatorKey,
        home: const SplashView(),
        title: "ShopShop",
        theme: CustomTheme.customThemeData(context),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
