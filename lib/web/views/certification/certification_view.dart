import 'package:dishank_dev_resume_website/web/utilities/all_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/certification/platform/mobile_certification_view.dart';
import 'package:dishank_dev_resume_website/web/views/certification/platform/web_certification_view.dart';
import 'package:dishank_dev_resume_website/web/views/restrict/restrict_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CertificationView extends StatelessWidget {
  const CertificationView({required this.rootPageController, super.key});
  final PageController rootPageController;

  @override
  Widget build(final BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(ImageAssets.background4),
          fit: BoxFit.cover,
        ),
        color: Color(AppColor.bgBlack),
      ),
      child: context.layout(
        mobile: MobileCertificationView(controller: rootPageController),
        tablet: const RestrictView(),
        web: WebCertificationView(controller: rootPageController),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<PageController>(
        'rootPageController',
        rootPageController,
      ),
    );
  }
}
