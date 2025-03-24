import 'package:dishank_dev_resume_website/web/utilities/all_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/contact/platform/mobile_contact_view.dart';
import 'package:dishank_dev_resume_website/web/views/contact/platform/web_contact_view.dart';
import 'package:dishank_dev_resume_website/web/views/restrict/restrict_view.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(ImageAssets.background5),
          fit: BoxFit.cover,
        ),
        color: Color(AppColor.bgBlack),
      ),
      child: context.layout(
        mobile: const MobileContactView(),
        tablet: const RestrictView(withBg: false),
        web: const WebContactView(),
      ),
    );
  }
}
