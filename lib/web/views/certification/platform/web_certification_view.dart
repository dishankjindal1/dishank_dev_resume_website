import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:flutter/material.dart';

class WebCertificationView extends StatelessWidget {
  final PageController controller;

  const WebCertificationView({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderFill(space: 32),
        const Gap(60),
        Align(
          alignment: Alignment.center,
          child: Text(
            AppText.certificationtext1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  height: 0.5,
                ),
          ),
        ),
        const Gap(48),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...List.generate(
                9,
                (index) => GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      pageBuilder: (context, a, b) {
                        return ScaleTransition(
                          scale: CurvedAnimation(
                            parent: a,
                            curve: Curves.easeIn,
                          ),
                          child: Material(
                            type: MaterialType.transparency,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: InteractiveViewer(
                                child: Align(
                                  child: Container(
                                    margin: const EdgeInsets.all(24),
                                    child: Image.network(
                                      AppUrl.certificateUrl(index),
                                      fit: BoxFit.fitWidth,
                                      alignment: Alignment.topLeft,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        color: Color(AppColor.bgYellow),
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Image.network(
                        AppUrl.certificateUrl(index),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Spacer(),
        const Gap(48 * 2),
      ],
    );
  }
}
