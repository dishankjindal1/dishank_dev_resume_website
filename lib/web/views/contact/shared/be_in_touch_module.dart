import 'dart:async';

import 'package:dishank_dev_resume_website/web/utilities/all_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/commons/extensions/box.dart';
import 'package:dishank_dev_resume_website/web/views/commons/extensions/padding.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BeInTouchModule extends StatelessWidget {
  const BeInTouchModule({super.key});

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    final double iconSize = context.layout<double>(
      mobile: 48,
      tablet: 48,
      web: 60,
    );

    final double iconSpacing = context.layout<double>(
      mobile: 36,
      tablet: 36,
      web: 48,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          AppText.contactText3,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const Gap(24),
        Wrap(
          spacing: iconSpacing,
          runSpacing: iconSpacing,
          children: <Widget>[
            InkWell(
              onTap:
                  () => unawaited(
                    launchUrlString(
                      AppUrl.github,
                      mode: LaunchMode.externalApplication,
                    ),
                  ),
              child: const Image(
                image: NetworkImage(ImageAssets.github),
                fit: BoxFit.contain,
              ).size(iconSize),
            ),
            InkWell(
              onTap:
                  () => unawaited(
                    launchUrlString(
                      AppUrl.email,
                      mode: LaunchMode.externalApplication,
                    ),
                  ),
              child: const Image(
                image: NetworkImage(ImageAssets.gmail),
                fit: BoxFit.contain,
              ).size(iconSize),
            ),
            InkWell(
              onTap:
                  () => unawaited(
                    launchUrlString(
                      AppUrl.x,
                      mode: LaunchMode.externalApplication,
                    ),
                  ),
              child: const Image(
                image: NetworkImage(ImageAssets.x),
                fit: BoxFit.contain,
              ).size(iconSize),
            ),
          ],
        ).padding(EdgeInsets.symmetric(horizontal: size.width * 0.1)),
      ],
    );
  }
}
