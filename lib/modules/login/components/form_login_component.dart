// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormLoginComponent extends StatefulWidget {
  final RxBool prosseguir;
  final RxBool verSenha;
  final RxBool cadastro;
  final RxString? erroEmail;
  final RxString? erroSenha;
  final RxString? erroConfirmarSenha;
  final Rx<TextEditingController> emailController;
  final Rx<TextEditingController> senhaController;
  final Rx<TextEditingController> confirmarSenhaController;
  final Function()? entrar;
  final void Function(String value)? onEmailChanged;
  final void Function(String value)? onSenhaChanged;
  final void Function(String value)? onConfirmarSenhaChanged;
  const FormLoginComponent({
    super.key,
    required this.verSenha,
    required this.cadastro,
    required this.emailController,
    required this.senhaController,
    required this.confirmarSenhaController,
    required this.entrar,
    this.onEmailChanged,
    this.onSenhaChanged,
    this.onConfirmarSenhaChanged,
    this.erroEmail,
    this.erroSenha,
    this.erroConfirmarSenha,
    required this.prosseguir,
  });

  @override
  State<FormLoginComponent> createState() => _FormLoginComponentState();
}

class _FormLoginComponentState extends State<FormLoginComponent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          reverse: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              fit: BoxFit.fill,
                              height: 200,
                              width: 200,
                              'assets/images/logolistai.png',
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          widget.cadastro.value ? 'Cadastro' : 'Login',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.cadastro.value
                              ? 'Crie sua conta'
                              : 'Entre com seu e-mail e senha',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: 'E-mail',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                            fillColor: Colors.white,
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            errorText: widget.erroEmail?.value.isEmpty == true
                                ? null
                                : widget.erroEmail?.value,
                          ),
                          controller: widget.emailController.value,
                          onChanged: widget.onEmailChanged,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.disabled,
                          obscureText: !widget.verSenha.value,
                          decoration: InputDecoration(
                            errorText: widget.erroSenha?.value.isEmpty == true
                                ? null
                                : widget.erroSenha?.value,
                            hintText: 'Senha',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.lock, color: Colors.white),
                            fillColor: Colors.white,
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                widget.verSenha.value = !widget.verSenha.value;
                                log(widget.verSenha.value.toString());
                              },
                              icon: Icon(
                                !widget.verSenha.value
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off,
                                color: Colors.white,
                                opticalSize: 10,
                              ),
                            ),
                          ),
                          controller: widget.senhaController.value,
                          onChanged: widget.onSenhaChanged,
                        ),
                        Visibility(
                          visible: widget.cadastro.value,
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                obscureText: !widget.verSenha.value,
                                decoration: InputDecoration(
                                  errorText:
                                      widget
                                              .erroConfirmarSenha
                                              ?.value
                                              .isEmpty ==
                                          true
                                      ? null
                                      : widget.erroConfirmarSenha?.value,
                                  hintText: 'Confirmar senha',
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  fillColor: Colors.white,
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      widget.verSenha.value =
                                          !widget.verSenha.value;
                                      log(widget.verSenha.value.toString());
                                    },
                                    icon: Icon(
                                      !widget.verSenha.value
                                          ? Icons.remove_red_eye
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                      opticalSize: 10,
                                    ),
                                  ),
                                ),
                                controller:
                                    widget.confirmarSenhaController.value,
                                onChanged: widget.onConfirmarSenhaChanged,
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: !widget.cadastro.value,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              child: Text(
                                'Esqueçeu a senha?',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          height: 50,
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: widget.prosseguir.value
                                ? !widget.cadastro.value
                                      ? () {
                                          widget.entrar!();
                                        }
                                      : () {}
                                : null,
                            child: Text(
                              !widget.cadastro.value ? 'Entrar' : 'Cadastrar',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 30,
                      ),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: !widget.cadastro.value
                                  ? 'Não tem uma conta? '
                                  : 'Já tem uma conta? ',
                            ),
                            TextSpan(
                              text: !widget.cadastro.value
                                  ? 'Cadastre-se'
                                  : 'Login',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  widget.cadastro.value =
                                      !widget.cadastro.value;
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
