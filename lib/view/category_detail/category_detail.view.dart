import 'package:flutter/material.dart';
import 'package:task/view/common_widgets/custom_grid_delegate.dart';
import 'package:task/view/common_widgets/custom_scaffold.dart';
import 'package:task/view/category_detail/category_detail.viewmodel.dart';
import 'package:task/view/category_detail/category_detail.widgets.dart';

class CategoryDetailView extends StatefulWidget {
  const CategoryDetailView({super.key});

  @override
  State<CategoryDetailView> createState() => _CategoryDetailViewState();
}

class _CategoryDetailViewState extends State<CategoryDetailView>
    with CategoryDetailWidgets {
  @override
  void initState() {
    CategoryDetailViewModel().buildProductNameList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = CategoryDetailViewModel().of(context);
    return CustomScaffold(
      appBar: appBar(provider),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: CustomGridDelegate.gridDelegate(context),
        itemCount: provider.productNameList.length,
        itemBuilder: (context, index) {
          return buildProduct(provider, index);
        },
      ),
    );
  }
}
