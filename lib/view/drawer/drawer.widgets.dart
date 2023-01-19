import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:task/core/init/routes/navigation_service.dart';
import 'package:task/view/common_widgets/custom_auto_size_text.dart';
import 'package:task/view/common_widgets/custom_viewer_image.dart';
import 'package:task/core/constants/color_constant.dart';
import 'package:task/core/data/enum/routes.enum.dart';
import 'package:task/core/data/service/category_service.dart';
import 'package:task/gen/assets.gen.dart';

import '../common_widgets/custom_circular_progress_indicator.dart';
import '../category_detail/category_detail.viewmodel.dart';

class DrawerWidgets {
  Widget categoryList() {
    return FutureBuilder(
      future: CategoryService().getCategories(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        } else {
          return Center(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return categoryItem(context, snapshot, index);
              },
            ),
          );
        }
      },
    );
  }

  InkWell categoryItem(BuildContext context, snapshot, int index) {
    return InkWell(
        onTap: () {
          CustomNavigator.instance.navigateToPage(Routes.categoryDetail.name);
          context.read<CategoryDetailViewModel>().categoryDetail =
              snapshot.data![index]!;
          CategoryDetailViewModel()
              .of(context, listen: false)
              .productNameList
              .clear();
        },
        child: ListTile(
          title: CustomText(
            text: snapshot.data![index]!.name!,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
            color: ColorConstant.instance.dark2,
          ),
        ));
  }

  CustomImageViewer logo(BuildContext context) {
    return CustomImageViewer(
      height: context.dynamicHeight(0.1),
      assetPath: Assets.images.logo.path,
    );
  }
}
