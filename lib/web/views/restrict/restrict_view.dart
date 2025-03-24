import 'package:dishank_dev_resume_website/web/utilities/all_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:gap/gap.dart';

class RestrictView extends StatelessWidget {
  const RestrictView({this.withBg = true, super.key});
  final bool withBg;

  @override
  Widget build(final BuildContext context) {
    return Material(
      type: withBg ? MaterialType.canvas : MaterialType.transparency,
      color: withBg ? const Color(AppColor.bgBlack) : null,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        decoration:
            withBg
                ? const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(ImageAssets.background1),
                    alignment: Alignment.topLeft,
                    fit: BoxFit.cover,
                  ),
                )
                : null,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            const RingExpanding(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(image: NetworkImage(ImageAssets.logo)),
                const Gap(24),
                Text(
                  'Please view after some time!\ncoming soon.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Code is poetry - every line has a purpose,\nand every function tells a story.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall,
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
    properties.add(DiagnosticsProperty<bool>('withBg', withBg));
  }
}

class RingExpanding extends StatefulWidget {
  const RingExpanding({super.key});

  @override
  State<RingExpanding> createState() => _RingExpandingState();
}

class _RingExpandingState extends State<RingExpanding>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Tween<double> scaleValue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    const SpringDescription spring = SpringDescription(
      mass: 40,
      stiffness: 1,
      damping: 1,
    );

    final SpringSimulation simulation = SpringSimulation(spring, 0, 1, 1);

    _animationController
      ..animateWith(simulation)
      ..forward()
      ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (final BuildContext context, _) {
        return Opacity(
          opacity: _animationController.value,
          child: SizedBox.square(
            dimension: 500 * _animationController.value,
            child: const Material(
              type: MaterialType.transparency,
              shape: CircleBorder(
                side: BorderSide(width: 2, color: Color(AppColor.bgYellow)),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<AnimationController>(
          'controller',
          _animationController,
        ),
      )
      ..add(DiagnosticsProperty<Tween<double>>('scaleValue', scaleValue));
  }
}
