import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormLoginComponent extends StatefulWidget {
  RxBool verSenha;
  RxBool cadastro;
  Function()? entrar;
  FormLoginComponent({
    super.key,
    required this.verSenha,
    required this.cadastro,
    required this.entrar,
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
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: !widget.verSenha.value,
                          decoration: InputDecoration(
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
                        ),
                        Visibility(
                          visible: widget.cadastro.value,
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              TextFormField(
                                obscureText: !widget.verSenha.value,
                                decoration: InputDecoration(
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
                            onPressed: !widget.cadastro.value
                                ? () {
                                    widget.entrar!();
                                  }
                                : () {},
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
