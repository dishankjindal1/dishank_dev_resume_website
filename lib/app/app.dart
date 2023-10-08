import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/app/views/main_view.dart';
import 'package:dishank_dev_resume_website/app/views/restrict_view/restrict_view.dart';

final GlobalKey<NavigatorState> navState = GlobalKey();

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'Dishank Jindal | Mobile Software Engineer',
      color: Colors.teal,
      navigatorKey: navState,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name != null) {
          if (settings.name!.startsWith('/')) {
            return MaterialPageRoute(
              builder: (context) => const MainWebView(),
            );
          }
        }
        return MaterialPageRoute(
          builder: (context) => const RestrictView(),
        );
      },
      textStyle: GoogleFonts.roboto(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(WebColorAsset.bgYellow),
            ),
            textTheme: const TextTheme(
                displayLarge: TextStyle(
                  fontSize: 60,
                  height: 1.25,
                  fontWeight: FontWeight.w700,
                  color: Color(WebColorAsset.textWhite),
                ),
                titleLarge: TextStyle(
                  fontSize: 48,
                  height: 1.25,
                  fontWeight: FontWeight.w700,
                  color: Color(WebColorAsset.textWhite),
                ),
                titleMedium: TextStyle(
                  fontSize: 42,
                  height: 1.25,
                  fontWeight: FontWeight.w600,
                  color: Color(WebColorAsset.textWhite),
                ),
                headlineMedium: TextStyle(
                  fontSize: 36,
                  height: 1.25,
                  fontWeight: FontWeight.w700,
                  color: Color(WebColorAsset.textYellow),
                ),
                headlineSmall: TextStyle(
                  fontSize: 32,
                  height: 1.25,
                  fontWeight: FontWeight.w600,
                  color: Color(WebColorAsset.textWhite),
                ),
                bodyMedium: TextStyle(
                  fontSize: 28,
                  height: 1.25,
                  fontWeight: FontWeight.w500,
                  color: Color(WebColorAsset.textWhite),
                ),
                labelSmall: TextStyle(
                  fontSize: 16,
                  height: 1.25,
                  fontWeight: FontWeight.w300,
                  color: Color(WebColorAsset.textWhite),
                )),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: constraints.maxHeight / 1270,
              ),
              child: Builder(builder: (context) {
                if (constraints.minWidth < 1270) {
                  return const RestrictView();
                }
                return SizedBox(
                  child: child,
                );
              }),
            );
          }),
        );
      },
    );
  }
}
