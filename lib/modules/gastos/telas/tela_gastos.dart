import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:listaai/modules/gastos/controller/tela_gastos.controller.dart';

class TelaGastos extends StatefulWidget {
  const TelaGastos({super.key});

  @override
  State<TelaGastos> createState() => _TelaGastosState();
}

class _TelaGastosState extends State<TelaGastos> {
  final controller = GetIt.I.get<GastosController>();

  @override
  Widget build(BuildContext context) {
    // Calcular o valor máximo uma vez
    final maxPrice = controller.produtos.isNotEmpty
        ? controller.produtos
              .map((p) => p.preco)
              .reduce((a, b) => a > b ? a : b)
        : 1.0;

    const maxHeight = 320.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Gastos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gráfico de Gastos por Produto',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SizedBox(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final produto = controller.produtos[index];
                    final barHeight = maxPrice > 0
                        ? (produto.preco / maxPrice) * maxHeight
                        : 0.0;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 40,
                          height: barHeight,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'R\$ ${produto.preco.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: controller.produtos.length,
                ),
              ),
            ),
            SizedBox(height: 125),
          ],
        ),
      ),
    );
  }
}
