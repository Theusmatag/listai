import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:listaai/modules/inicio/controller/inicio_controller.dart';
import 'package:listaai/modules/tela_base/componentes/card_graficos.dart';

class TelaInicio extends StatefulWidget {
  const TelaInicio({super.key});

  @override
  State<TelaInicio> createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  @override
  void initState() {
    super.initState();
  }

  final inicioController = GetIt.I.get<InicioController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('inicio')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(children: [CardGraficos()]),
      ),
    );
  }
}
