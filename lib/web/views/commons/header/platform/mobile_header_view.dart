import 'dart:async';

import 'package:dishank_dev_resume_website/web/utilities/all_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/global_keys.dart';
import 'package:dishank_dev_resume_website/web/views/commons/buttons/circle_button.dart';
import 'package:dishank_dev_resume_website/web/views/commons/header/shared/drop_down_menu.dart';
import 'package:dishank_dev_resume_website/web/views/commons/header/shared/mobile_menu_overlay.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MobileHeaderView extends StatefulWidget {
  const MobileHeaderView(
    this.pageController, {
    required this.menuItems,
    required this.menuButtonCtrl,
    super.key,
  });
  final PageController pageController;
  final Map<String, VoidCallback> menuItems;
  final OverlayPortalController menuButtonCtrl;

  @override
  State<MobileHeaderView> createState() => _MobileHeaderViewState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<PageController>('pageController', pageController),
      )
      ..add(
        DiagnosticsProperty<Map<String, VoidCallback>>('menuItems', menuItems),
      )
      ..add(
        DiagnosticsProperty<OverlayPortalController>(
          'menuButtonCtrl',
          menuButtonCtrl,
        ),
      );
  }
}

class _MobileHeaderViewState extends State<MobileHeaderView> {
  late final WidgetStatesController buttonState;

  @override
  void initState() {
    super.initState();
    buttonState = WidgetStatesController();
  }

  @override
  void dispose() {
    buttonState.dispose();
    widget.menuButtonCtrl.hide();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return OverlayPortal(
      controller: widget.menuButtonCtrl,
      overlayChildBuilder: (final BuildContext context) {
        return MobileMenuOverlay(
          child: DropDownMenuWidget(
            widget.pageController,
            headerMenuItems: widget.menuItems,
            menuButtonCtrl: widget.menuButtonCtrl,
          ),
        );
      },
      child: Container(
        height: 76,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            const Image(image: NetworkImage(ImageAssets.logo)).animate().rotate(
              begin: 10,
              duration: const Duration(milliseconds: 1000),
            ),
            const Spacer(),
            AppCircleButton(
              label: AppText.linkedin,
              labelStyle: Theme.of(context).textTheme.headlineSmall,
              callback:
                  () => unawaited(
                    launchUrlString(
                      AppUrl.linkedin,
                      mode: LaunchMode.externalApplication,
                    ),
                  ),
              highlightColor: AppColor.bgYellow,
              borderColor: AppColor.bgYellow,
              borderRadius: 24,
            ),
            const Gap(24),
            InkWell(
              key: UniqueKey(),
              onTap: () => widget.menuButtonCtrl.toggle(),
              child: Image(
                key: AppGlobalKey.menuKey,
                image: const NetworkImage(ImageAssets.menu),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<WidgetStatesController>('buttonState', buttonState),
    );
  }
}
