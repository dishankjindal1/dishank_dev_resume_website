import 'dart:async';

import 'package:dishank_dev_resume_website/web/core/text_animating_widget.dart';
import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/enums.dart';
import 'package:dishank_dev_resume_website/web/utilities/global_keys.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/views/home/hollow_container_painter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animate_border/flutter_animate_border.dart';
import 'package:gap/gap.dart';

class MobileHomeView extends StatefulWidget {
  const MobileHomeView({super.key});

  @override
  State<MobileHomeView> createState() => _MobileHomeViewState();
}

class _MobileHomeViewState extends State<MobileHomeView>
    with SingleTickerProviderStateMixin {
  final FlutterAnimateBorderController controller =
      FlutterAnimateBorderController();

  late final AnimationController _animationController;
  late final Animation<double> _animateValue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animateValue = CurveTween(
      curve: Curves.decelerate,
    ).animate(_animationController);
    unawaited(
      Future<void>.delayed(const Duration(seconds: 1)).then((_) {
        _animationController.forward();
      }),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final FlutterAnimateBorderController controller =
        FlutterAnimateBorderController();

    final double circleSize = size.width * 0.5;
    final double circleStroke = size.width * 0.03;
    final double innerCardHeight = size.height * 0.84;

    int innerIndex = 0;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: size.width * 0.85,
        height: innerCardHeight,
        margin: const EdgeInsets.only(top: 100),
        child: ListenableBuilder(
          listenable: _animateValue,
          builder: (final BuildContext context, final Widget? child) {
            return CustomPaint(
              painter: HollowContainer(
                layout: Layout.mobile,
                circleSize: circleSize,
                stroke: circleStroke,
                circular: 40,
                animate: AppGlobalKey.initialBoot ? 1 : _animateValue.value,
              ),
              child: child,
            );
          },
          child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox.square(
                      dimension: circleSize,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 12,
                            color: const Color(AppColor.bgYellow),
                          ),
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: FlutterAnimateBorder(
                          controller:
                              controller
                                ..setGradient(
                                  const SweepGradient(
                                    colors: <Color>[
                                      Colors.black,
                                      Colors.blue,
                                      Color(AppColor.bgYellow),
                                      Colors.green,
                                      Colors.red,
                                    ],
                                  ),
                                )
                                ..setCornerRadius(1000)
                                ..setLineThickness(4)
                                ..setLineWidth(80)
                                ..setLinePadding(40),
                          child: Image.network(ImageAssets.dp),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      circleStroke * 2,
                    ).add(const EdgeInsets.only(left: 8, top: 4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          <Widget>[
                            const Spacer(),
                            Text(
                              AppText.homeText1,
                              style: Theme.of(
                                context,
                              ).textTheme.headlineLarge?.copyWith(
                                shadows: <Shadow>[const Shadow(blurRadius: 16)],
                              ),
                            ),
                            const Gap(24),
                            TextAnimatingWidget(
                              AppText.homeText2,
                              style: Theme.of(
                                context,
                              ).textTheme.displayMedium?.copyWith(
                                shadows: <Shadow>[const Shadow(blurRadius: 16)],
                              ),
                            ),

                            const Gap(24),
                            Text(
                              AppText.homeText3,
                              style: Theme.of(
                                context,
                              ).textTheme.headlineLarge?.copyWith(
                                shadows: <Shadow>[const Shadow(blurRadius: 16)],
                              ),
                            ),
                            const Gap(24),
                            Text(
                              AppText.homeText4,
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                shadows: <Shadow>[const Shadow(blurRadius: 16)],
                              ),
                            ),
                            const Spacer(),
                            Gap(circleSize),
                          ].map((final Widget e) {
                            if (AppGlobalKey.initialBoot) {
                              return e;
                            }

                            if (e is Text || e is TextAnimatingWidget) {
                              const int timerDuration = 800;
                              innerIndex += 1;
                              return e
                                  .animate(
                                    delay: Duration(
                                      milliseconds: timerDuration * innerIndex,
                                    ),
                                  )
                                  .fade(
                                    begin: 0,
                                    end: 1,
                                    duration: const Duration(
                                      milliseconds: timerDuration ~/ 2,
                                    ),
                                    curve: Curves.decelerate,
                                  )
                                  .slideX(
                                    begin: -0.2,
                                    duration: const Duration(
                                      milliseconds: timerDuration,
                                    ),
                                    curve: Curves.decelerate,
                                  );
                            }

                            return e;
                          }).toList(),
                    ),
                  ),
                ],
              )
              .animate(delay: const Duration(seconds: 2))
              .fade(
                duration: const Duration(milliseconds: 1000),
                begin: AppGlobalKey.initialBoot ? 1 : 0,
                end: 1,
              ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<FlutterAnimateBorderController>(
        'controller',
        controller,
      ),
    );
  }
}
