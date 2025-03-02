import 'dart:async';

import 'package:dishank_dev_resume_website/web/views/certification/certification_view.dart';
import 'package:dishank_dev_resume_website/web/views/commons/header/header_view.dart';
import 'package:dishank_dev_resume_website/web/views/commons/page_dot/page_dot_module.dart';
import 'package:dishank_dev_resume_website/web/views/contact/contact_view.dart';
import 'package:dishank_dev_resume_website/web/views/experience/experience_view.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/expertise_view.dart';
import 'package:dishank_dev_resume_website/web/views/home/home_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late Size size;
  late List<Widget> children;

  late final PageController rootPageController;
  late final OverlayPortalController _menuButtonCtrl;

  @override
  void initState() {
    super.initState();
    rootPageController = PageController();
    _menuButtonCtrl = OverlayPortalController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(
        rootPageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.decelerate,
        ),
      );
      initializer();
    });
  }

  @override
  void didChangeDependencies() {
    initializer();
    super.didChangeDependencies();
  }

  void initializer() {
    size = MediaQuery.sizeOf(context);
    children = <Widget>[
      SizedBox(width: size.width, height: size.height, child: const HomeView()),
      SizedBox(
        width: size.width,
        height: size.height,
        child: const ExpertiseView(),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: const ExperienceView(),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: CertificationView(rootPageController: rootPageController),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: const ContactView(),
      ),
    ];
  }

  @override
  void dispose() {
    rootPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        _menuButtonCtrl.hide();
      },
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: rootPageController,
              pageSnapping: false,
              scrollDirection: Axis.vertical,
              itemBuilder:
                  (final BuildContext context, final int index) =>
                      children[index],
              itemCount: children.length,
            ),
            HeaderView(rootPageController, _menuButtonCtrl),
            Align(
              alignment: const Alignment(0.95, 0.95),
              child: PageDotModule.vertical(
                rootPageController,
                totalPages: children.length,
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
    properties
      ..add(DiagnosticsProperty<Size>('size', size))
      ..add(
        DiagnosticsProperty<PageController>(
          'rootPageController',
          rootPageController,
        ),
      );
  }
}
