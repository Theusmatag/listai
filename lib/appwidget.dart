import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:listaai/modules/login/present/login_screen.dart';
import 'package:listaai/theme/app_theme.dart';

import 'global/services/navigator_global_key.dart';

class Appwidget extends StatelessWidget {
  const Appwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      navigatorKey: AppGlobalNavigatorKey.navigatorKey,
      themeAnimationCurve: Curves.linear,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      ),
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => const LoginScreen()},
    );
  }
}
