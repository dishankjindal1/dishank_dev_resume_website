import 'package:dishank_dev_resume_website/web/utilities/global_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class HeaderFill extends StatelessWidget {
  const HeaderFill({this.space = 0, super.key});
  final double space;

  @override
  Widget build(final BuildContext context) {
    try {
      return SizedBox(
        height:
            space +
            ((AppGlobalKey.headerKey.currentContext?.findRenderObject()
                        as RenderBox?)
                    ?.size
                    .height ??
                0),
      );
    } on Object {
      return const SizedBox.shrink();
    }
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('space', space));
  }
}
