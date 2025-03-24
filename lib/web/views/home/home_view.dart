import 'package:dishank_dev_resume_website/web/utilities/all_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/home/platform/mobile_home_view.dart';
import 'package:dishank_dev_resume_website/web/views/home/platform/web_home_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(ImageAssets.background1),
          fit: BoxFit.cover,
          alignment: Alignment.centerRight,
        ),
        color: Color(AppColor.bgBlack),
      ),
      child: context.layout(
        mobile: const MobileHomeView(),
        tablet: const SizedBox(),
        web: const WebHomeView(),
      ),
    );
  }
}
