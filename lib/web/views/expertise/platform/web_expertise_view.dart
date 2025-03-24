import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/global_keys.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/shared/info_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animate_border/flutter_animate_border.dart';
import 'package:gap/gap.dart';

class WebExpertiseView extends StatefulWidget {
  const WebExpertiseView(
    this.expertiseList,
    this.pianoNotes,
    this.playMusicCallback, {
    super.key,
  });

  final List<String> expertiseList;
  final List<String> pianoNotes;
  final void Function(int) playMusicCallback;

  @override
  State<WebExpertiseView> createState() => _WebExpertiseViewState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<String>('expertiseList', expertiseList))
      ..add(IterableProperty<String>('pianoNotes', pianoNotes))
      ..add(
        ObjectFlagProperty<void Function(int p1)>.has(
          'playMusicCallback',
          playMusicCallback,
        ),
      );
  }
}

class _WebExpertiseViewState extends State<WebExpertiseView> {
  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final List<AnimationController> listAnimation = <AnimationController>[];

    return Column(
      children: <Widget>[
        const HeaderFill(space: 120),
        Align(
          child: Text(
            AppText.expertiseLabel,
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(height: 0.5),
          ),
        ),
        const Gap(24),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(48),
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 16,
              spacing: 16,
              children:
                  List<Widget>.generate(
                        widget.expertiseList.length,
                        (final int index) => MouseRegion(
                          onEnter: (_) {
                            listAnimation[index].forward();
                            widget.playMusicCallback(index);
                          },
                          onExit: (_) {
                            listAnimation[index].reverse();
                          },

                          child: SizedBox(
                            width: size.width * 0.15,
                            height: 180,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: FlutterAnimateBorder(
                                controller:
                                    FlutterAnimateBorderController()
                                      ..setGradient(
                                        const RadialGradient(
                                          radius: 1,
                                          colors: <Color>[
                                            Color(AppColor.bgYellow),
                                            Colors.transparent,
                                          ],
                                        ),
                                      )
                                      ..setLineThickness(2)
                                      ..setLineWidth(48)
                                      ..setLinePadding(0)
                                      ..setCornerRadius(18),

                                child: (index.isEven
                                    ? InfoCard.light
                                    : InfoCard.dark)(
                                  label: widget.expertiseList[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .map(
                        (final Widget child) => child
                            .animate(
                              onInit: listAnimation.add,
                              autoPlay: !AppGlobalKey.initialBoot,
                            )
                            .scaleXY(
                              begin: 1,
                              end: AppGlobalKey.initialBoot ? 1.2 : 1,
                            ),
                      )
                      .toList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      IterableProperty<String>('expertiseList', widget.expertiseList),
    );
  }
}
