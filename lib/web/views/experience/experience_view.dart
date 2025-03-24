import 'package:dishank_dev_resume_website/web/utilities/all_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/experience/platform/mobile_experience_view.dart';
import 'package:dishank_dev_resume_website/web/views/experience/platform/web_experience_view.dart';
import 'package:dishank_dev_resume_website/web/views/restrict/restrict_view.dart';
import 'package:flutter/material.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(final BuildContext context) {
    const List<String> data = <String>[
      AppText.experiencedata1,
      AppText.experiencedata2,
      AppText.experiencedata3,
    ];

    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(ImageAssets.background3),
          fit: BoxFit.cover,
        ),
        color: Color(AppColor.bgBlack),
      ),
      child: context.layout(
        mobile: const MobileExperienceView(data: data),
        tablet: const RestrictView(withBg: false),
        web: const WebExperienceView(data: data),
      ),
    );
  }
}
