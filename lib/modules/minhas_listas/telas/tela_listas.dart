import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get/get.dart';
import 'package:listaai/modules/minhas_listas/componentes/adicionar_lista.dart';
import 'package:listaai/modules/minhas_listas/controller/listas_controller.dart';

class TelaListas extends StatefulWidget {
  const TelaListas({super.key});

  @override
  State<TelaListas> createState() => _TelaListasState();
}

class _TelaListasState extends State<TelaListas> {
  final controller = GetIt.I.get<ListasController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas listas'),
        actions: [
          IconButton(
            onPressed: () async {
              controller.adicionarNaLista(await ModalCriarLista.show(context));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.listas.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.list_alt, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'Nenhuma lista criada',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Text(
                  'Toque no + para criar sua primeira lista',
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              flex: 10,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Dismissible(
                        key: UniqueKey(), // Usar UniqueKey() para cada item
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        confirmDismiss: (direction) async {
                          return await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Confirmar exclusão'),
                              content: Text(
                                'Tem certeza que deseja excluir a lista?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text(
                                    'Excluir',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        onDismissed: (direction) {
                          controller.listas.removeAt(index);
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.list,
                              color: Color(0xff4169E1),
                            ),
                            title: Text(
                              controller.listas[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            trailing: const Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                            ),
                            onTap: () {
                              // Navegar para a tela de detalhes da lista
                              Navigator.of(context).pushNamed(
                                '/tela_detalhe_lista',
                                arguments: controller.listas[index],
                              );
                            },
                          ),
                        ),
                      );
                    }, childCount: controller.listas.length),
                  ),
                ],
              ),
            ),
            SizedBox(height: 125),
          ],
        );
      }),
    );
  }
}
