import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dart_fusion/dart_fusion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/routes/routes.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return ThemeProvider(
          initTheme: ref.watch(themeProvider).isDarkMode
              ? MyThemes.darkTheme
              : MyThemes.lightTheme,
          child: MaterialApp.router(
            title: "Damian Tochukwu",
            debugShowCheckedModeBanner: false,
            themeMode: ref.watch(themeProvider).themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            routerConfig: RouterGenerator.router,
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
            scrollBehavior: const DBehavior(),
          ),
        );
      },
    );
  }
}
