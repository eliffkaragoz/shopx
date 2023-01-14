import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:task/view/basket/basket.viewmodel.dart';
import 'package:task/view/category_detail/category_detail.viewmodel.dart';
import 'package:task/view/drawer/drawer.viewmodel.dart';
import 'package:task/view/home/home.viewmodel.dart';

class MultiProviderInit {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => DrawerViewModel()),
    ChangeNotifierProvider(create: (_) => CategoryDetailViewModel()),
    ChangeNotifierProvider(create: (_) => BasketViewModel()),
    ChangeNotifierProvider(create: (_) => HomeViewModel()),
  ];
}
