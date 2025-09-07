import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:listaai/modules/inicio/controller/inicio_controller.dart';

import '../controller/base_controller.dart';

class TelaBase extends StatefulWidget {
  const TelaBase({super.key});

  @override
  State<TelaBase> createState() => _TelaBaseState();
}

class _TelaBaseState extends State<TelaBase> {
  @override
  void initState() {
    super.initState();
  }

  final baseController = GetIt.I.get<BaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: baseController.indexAtual.value,
                children: [...baseController.telas.value],
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 120,
                    color: Theme.of(context).secondaryHeaderColor,
                    child: BottomNavigationBar(
                      currentIndex: baseController.indexAtual.value,
                      onTap: (value) {
                        baseController.indexAtual.value = value;
                      },
                      selectedIconTheme: IconThemeData(
                        color: Colors.blueAccent,
                      ),
                      selectedLabelStyle: TextStyle(color: Colors.blueAccent),
                      type: BottomNavigationBarType.fixed,
                      elevation: 1,
                      backgroundColor:
                          Colors.white, // Transparente para mostrar o blur
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Início',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.list_alt),
                          label: 'Minhas listas',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.attach_money_outlined),
                          label: 'Gastos',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.generating_tokens_sharp),
                          label: 'Premium',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.account_circle),
                          label: 'Account',
                        ),
                      ],
                      selectedItemColor: Theme.of(
                        context,
                      ).secondaryHeaderColor, // Cor do item selecionado
                      unselectedItemColor:
                          Colors.grey, // Cor dos itens não selecionados
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 140,
              right: 20,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurpleAccent,
                ),
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Image.asset(
                    color: Colors.white,
                    'assets/images/botaomagico.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
