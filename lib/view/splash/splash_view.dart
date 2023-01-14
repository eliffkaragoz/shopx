import 'package:flutter/material.dart';
import 'package:task/view/common_widgets/custom_viewer_image.dart';
import 'package:task/gen/assets.gen.dart';

import 'package:task/view/home/home.view.dart';
import 'package:kartal/kartal.dart';

class SplashView extends StatelessWidget {
  const SplashView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(context.durationSlow),
        builder: (ctx, timer) => timer.connectionState == ConnectionState.done
            ? const HomeView()
            : Center(
                child: CustomImageViewer(
                  assetPath: Assets.images.logo.path,
                ),
              ),
      ),
    );
  }
}
