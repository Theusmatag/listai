// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:listaai/global/components/error_component_dialog.dart';

import 'package:listaai/global/services/navigator_global_key.dart';
import 'package:listaai/modules/login/domain/usecases/login_usecase.dart';

class LoginController {
  RxBool verSenha = false.obs;

  RxBool carregando = false.obs;

  RxBool prosseguir = false.obs;

  RxBool cadastro = false.obs;

  RxBool ativarAnimacao = false.obs;

  RxString? erroEmail = ''.obs;

  RxString? erroSenha = ''.obs;

  RxString? erroConfirmarSenha = ''.obs;

  RxString email = ''.obs;

  RxString senha = ''.obs;

  RxString confirmarSenha = ''.obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;

  Rx<TextEditingController> senhaController = TextEditingController().obs;

  Rx<TextEditingController> confirmarSenhaController =
      TextEditingController().obs;

  LoginUseCase entrarUseCase;
  LoginController({required this.entrarUseCase});

  void entrar() {
    Navigator.of(
      AppGlobalNavigatorKey.navigatorKey.currentContext!,
    ).pushReplacementNamed('/base');
  }

  void setarValorDoEmail(String valorEmail) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]*com$');
    if (emailRegex.hasMatch(valorEmail)) {
      email.value = valorEmail;
      erroEmail?.value = '';
    } else {
      erroEmail?.value = 'Email inválido';
    }
    setarValorProsseguir();
  }

  void setarValorDaSenhaLogin(String valorSenha) {
    senha.value = valorSenha;
    setarValorProsseguir();
  }

  void setarValorDaSenhaCadastro(String valorSenha) {
    if (valorSenha.length < 6) {
      erroSenha?.value = 'Senha inválida';
    } else {
      erroSenha?.value = '';
    }
    senha.value = valorSenha;
  }

  void setarValorDaConfirmarSenha(String valorConfirmarSenha) {
    confirmarSenha.value = valorConfirmarSenha;
  }

  void login() async {
    carregando.value = true;
    var result = await entrarUseCase(email.value, senha.value);
    result.fold(
      (l) => showErrorComponentDialog(
        context: AppGlobalNavigatorKey.navigatorKey.currentContext!,
        error: l,
      ),
      (r) => entrar(),
    );
    carregando.value = false;
  }

  void setarValorProsseguir() {
    if (email.value.isNotEmpty &&
        senha.value.isNotEmpty &&
        erroEmail?.value == '' &&
        erroSenha?.value == '') {
      prosseguir.value = true;
    } else {
      prosseguir.value = false;
    }
  }
}
