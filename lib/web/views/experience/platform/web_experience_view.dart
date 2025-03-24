import 'package:dishank_dev_resume_website/web/utilities/all_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/extensions/padding.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/experience/shared/bullet_point_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WebExperienceView extends StatefulWidget {
  const WebExperienceView({required this.data, super.key});
  final List<String> data;

  @override
  State<WebExperienceView> createState() => _MobileExperienceViewState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<String>('data', data));
  }
}

class _MobileExperienceViewState extends State<WebExperienceView> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: <Widget>[
        const HeaderFill(),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: size.width * 0.6,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(AppColor.bgYellow),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
            ),
          ),
        ),
        const Gap(8),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: size.width * 0.5,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(AppColor.bgYellow),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 36),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Gap(size.height * 0.1),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              AppText.experiencetext1,
                              style: Theme.of(
                                context,
                              ).textTheme.displayMedium?.copyWith(height: 0.5),
                            ),
                            const Gap(6),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: size.width * 0.5,
                                height: 1,
                                margin: const EdgeInsets.only(left: 24),
                                color: const Color(AppColor.bgYellow),
                              ),
                            ),
                            const Gap(4),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: size.width * 0.5,
                                height: 1,
                                margin: const EdgeInsets.only(left: 48),
                                color: const Color(AppColor.bgYellow),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(24),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 36),
                        child: Column(
                          children: <Widget>[
                            ...widget.data.map((final String e) {
                              return BulletPointWidget(
                                text: e,
                              ).padding(const EdgeInsets.only(bottom: 36));
                            }),
                          ],
                        ),
                      ),
                      Gap(size.height * 0.1),
                      const Spacer(),
                    ],
                  ),
                ),
                Align(
                  child: SizedBox.square(
                    dimension: 360,
                    child: Image.network(ImageAssets.experienceView1),
                  ),
                ),
                const Gap(24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
