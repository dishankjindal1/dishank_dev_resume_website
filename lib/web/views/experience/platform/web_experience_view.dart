import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/views/commons/extensions/padding.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:flutter/material.dart';

class WebExperienceView extends StatefulWidget {
  final List<String> data;

  const WebExperienceView({
    required this.data,
    super.key,
  });

  @override
  State<WebExperienceView> createState() => _MobileExperienceViewState();
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
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
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
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Gap(size.height * 0.1),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              AppText.experiencetext1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    height: 0.5,
                                  ),
                            ),
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
                          children: [
                            ...widget.data.map((e) {
                              return BulletPointWidget(text: e).padding(
                                const EdgeInsets.only(bottom: 36),
                              );
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
                    child: Image.asset(ImageAssets.experienceView1),
                  ),
                ),
                const Gap.w(24)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BulletPointWidget extends StatelessWidget {
  final String text;

  const BulletPointWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Color(AppColor.bgYellow),
          size: 24,
        ),
        const Gap.w(24),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        )
      ],
    );
  }
}
