// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:listaai/modules/minhas_listas/componentes/iconButtonCart.dart';
import 'package:listaai/modules/minhas_listas/controller/listas_detalhes_controller.dart';

class TelaDetalhesListas extends StatefulWidget {
  final String nome;
  const TelaDetalhesListas({super.key, required this.nome});

  @override
  State<TelaDetalhesListas> createState() => _TelaDetalhesListasState();
}

class _TelaDetalhesListasState extends State<TelaDetalhesListas> {
  final controller = GetIt.I.get<ListasDetalhesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => ElevatedButton(
              onPressed: controller.tipoAcao.value == TipoAcao.nulo
                  ? () {
                      controller.iniciarCompras();
                    }
                  : () {
                      controller.tipoAcao.value = TipoAcao.nulo;
                    },
              child: Text(
                controller.tipoAcao.value == TipoAcao.nulo
                    ? 'Iniciar compras'
                    : 'Concluído',
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(widget.nome),
        actions: [
          // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          Obx(
            () => Visibility(
              visible: controller.tipoAcao.value == TipoAcao.nulo,
              child: PopupMenuButton<TipoAcao>(
                onSelected: (value) {
                  controller.tipoAcao.value = value;
                  log(controller.tipoAcao.value.toString());
                },
                position: PopupMenuPosition.under,
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: TipoAcao.adicionar,
                      child: Text('Adicionar produto'),
                    ),
                    PopupMenuItem(
                      value: TipoAcao.editar,
                      child: Text('Editar produto'),
                    ),
                    PopupMenuItem(
                      value: TipoAcao.remover,
                      child: Text('Remover produto'),
                    ),
                  ];
                },
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.produtos.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.list_alt, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'Nenhuma produto adicionado',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Text(
                  'Toque no + para criar seu primeiro produto',
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                ),
              ],
            ),
          );
        }
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final produto = controller.produtos[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Obx(() {
                    return ListTile(
                      leading: Visibility(
                        visible: controller.comprasIniciadas.value,
                        child: GestureDetector(
                          onTap: () {
                            controller.trocarAcaoProduto(index);
                          },
                          child: controller.trocarIconeProduto(
                            controller.produtos[index].estado,
                          ),
                        ),
                      ),
                      title: Text(produto.nome),
                      subtitle: produto.preco != null
                          ? Text('R\$ ${produto.preco.toStringAsFixed(2)}')
                          : null,
                      trailing: controller.tipoAcao.value == TipoAcao.remover
                          ? IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {},
                            )
                          : controller.tipoAcao.value == TipoAcao.editar
                          ? IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {},
                            )
                          : controller.comprasIniciadas.value
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconCartButton(
                                  onTap: () {},
                                  icon: Icons.remove,
                                ),
                                Text('1'),
                                IconCartButton(onTap: () {}, icon: Icons.add),
                              ],
                            )
                          : SizedBox(),
                    );
                  }),
                );
              }, childCount: controller.produtos.length),
            ),
          ],
        );
      }),
    );
  }
}
