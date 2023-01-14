import 'package:flutter/material.dart';
import 'package:task/view/common_widgets/custom_circular_progress_indicator.dart';
import 'package:task/view/common_widgets/custom_scaffold.dart';
import 'package:task/core/data/service/product_service.dart';
import 'package:task/view/home/widgets/search_bar.dart';
import 'package:task/view/basket/basket.viewmodel.dart';
import 'package:task/view/drawer/drawer.view.dart';
import 'package:task/view/home/home.widgets.dart';

class HomeView extends StatefulWidget with HomeWidgets {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeWidgets {
  String query2 = "";

  @override
  Widget build(BuildContext context) {
    final provider = BasketViewModel().of(context);

    return CustomScaffold(
      drawer: const DrawerView(),
      appBar: appBar(context),
      body: FutureBuilder(
        future: ProductService().getProducts(query: query2),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CustomCircularProgressIndicator();
          } else {
            return Stack(
              children: [
                productList(context, snapshot, provider),
                searchBar(),
              ],
            );
          }
        },
      ),
    );
  }

  SearchBar searchBar() {
    return SearchBar(
      onChanged: (value) async {
        setState(() {
          query2 = value;
        });
      },
    );
  }
}
