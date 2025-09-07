import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:listaai/modules/login/presenters/login_screen.dart';
import 'package:listaai/modules/minhas_listas/telas/tela_detalhes_listas.dart';
import 'package:listaai/modules/tela_base/presenters/tela_base.dart';
import 'package:listaai/theme/app_theme.dart';

import 'global/services/navigator_global_key.dart';

class Appwidget extends StatelessWidget {
  const Appwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      left: false,
      right: false,
      top: false,
      child: MaterialApp(
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkTheme,
        theme: AppTheme.lightTheme,
        navigatorKey: AppGlobalNavigatorKey.navigatorKey,
        themeAnimationCurve: Curves.linear,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const LoginScreen(),
          '/base': (context) => const TelaBase(),
          '/tela_detalhe_lista': (context) => TelaDetalhesListas(
            nome: ModalRoute.of(context)!.settings.arguments as String,
          ),
        },
      ),
    );
  }
}
