import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:listaai/global/services/navigator_global_key.dart';

class LoginController {
  RxBool verSenha = false.obs;
  RxBool cadastro = false.obs;
  RxBool ativarAnimacao = false.obs;

  void entrar() {
    Navigator.of(
      AppGlobalNavigatorKey.navigatorKey.currentContext!,
    ).pushReplacementNamed('/base');
  }
}
