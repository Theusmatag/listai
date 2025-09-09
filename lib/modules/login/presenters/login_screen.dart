import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:listaai/modules/login/components/form_login_component.dart';
import 'package:listaai/modules/login/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(
        Duration(milliseconds: 0),
      ).then((value) => loginController.ativarAnimacao.value = true);
    });
  }

  final loginController = GetIt.I.get<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4169E1),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Obx(
            () => !loginController.carregando.value
                ? AnimatedOpacity(
                    curve: Curves.ease,
                    opacity: loginController.ativarAnimacao.value ? 1.0 : 0.0,
                    duration: const Duration(seconds: 4),
                    child: FormLoginComponent(
                      prosseguir: loginController.prosseguir,
                      verSenha: loginController.verSenha,
                      cadastro: loginController.cadastro,
                      entrar: () {
                        loginController.login();
                      },
                      emailController: loginController.emailController,
                      senhaController: loginController.senhaController,
                      confirmarSenhaController:
                          loginController.confirmarSenhaController,
                      onEmailChanged: (value) {
                        loginController.setarValorDoEmail(value);
                      },
                      onConfirmarSenhaChanged: (value) {
                        loginController.setarValorDaConfirmarSenha(value);
                      },
                      onSenhaChanged: (value) {
                        loginController.setarValorDaSenhaLogin(value);
                      },
                      erroEmail: loginController.erroEmail,
                      erroSenha: loginController.erroSenha,
                      erroConfirmarSenha: loginController.erroConfirmarSenha,
                    ),
                  )
                : Center(child: CircularProgressIndicator(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
