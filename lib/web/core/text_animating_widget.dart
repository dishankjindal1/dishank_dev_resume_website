import 'dart:async';

import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextAnimatingWidget extends StatefulWidget {
  const TextAnimatingWidget(this.text, {this.style, super.key});

  final String text;
  final TextStyle? style;

  @override
  State<TextAnimatingWidget> createState() => _TextAnimatingWidgetState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<TextStyle?>('style', style));
  }
}

class _TextAnimatingWidgetState extends State<TextAnimatingWidget>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimationController _animationControllerForTypeWriter;

  int loopCount = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      reverseDuration: const Duration(milliseconds: 500),
    );

    _animationControllerForTypeWriter = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..repeat(reverse: true);

    unawaited(
      Future<void>.delayed(const Duration(milliseconds: 1200)).then((_) {
        if (mounted) {
          _animationController.forward();
        }
      }),
    );

    _animationController.addStatusListener((final AnimationStatus status) {
      if (loopCount == widget.text.split(',').length - 1) {
        _animationControllerForTypeWriter.repeat(
          count: 6,
          period: const Duration(milliseconds: 800),
        );
        return;
      }
      if (status == AnimationStatus.completed) {
        unawaited(
          Future<void>.delayed(const Duration(milliseconds: 1500)).then((_) {
            if (mounted) {
              _animationController.reverse();
            }
          }),
        );
      } else if (status == AnimationStatus.dismissed) {
        loopCount += 1;
        unawaited(
          Future<void>.delayed(const Duration(milliseconds: 250)).then((_) {
            if (mounted) {
              _animationController.forward();
            }
          }),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerForTypeWriter.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => ListenableBuilder(
    listenable: Listenable.merge(<Listenable?>[
      _animationController,
      _animationControllerForTypeWriter,
    ]),
    builder: (final BuildContext context, _) {
      final List<String> listOfString = widget.text.split(',');
      String animatedText = '';

      animatedText = listOfString[loopCount].substring(
        0,
        (listOfString[loopCount].length * _animationController.value).round(),
      );

      return Text.rich(
        TextSpan(
          text: "I'm $animatedText",
          children: <InlineSpan>[
            if (_animationController.status == AnimationStatus.reverse ||
                (!_animationController.isAnimating &&
                    _animationControllerForTypeWriter.value >= 0.5))
              const TextSpan(
                text: ' |',
                style: TextStyle(color: Color(AppColor.textYellow)),
              ),
          ],
        ),
        style: widget.style,
      );
    },
  );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('loopCount', loopCount));
  }
}
