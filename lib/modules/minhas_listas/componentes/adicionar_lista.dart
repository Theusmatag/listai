import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalCriarLista extends StatefulWidget {
  const ModalCriarLista({super.key});

  @override
  State<ModalCriarLista> createState() => _ModalCriarListaState();

  // Método estático para mostrar o modal
  static Future<String?> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const ModalCriarLista(),
    );
  }
}

final formKey = GlobalKey<FormState>().obs;

class _ModalCriarListaState extends State<ModalCriarLista> {
  final Rx<TextEditingController> _nomeController = TextEditingController().obs;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10), // Padding de 10 em todos os lados
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width:
            MediaQuery.of(context).size.width -
            20, // Largura total menos o padding
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            Text(
              'Criar lista',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Campo de texto
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey.value,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, insira um nome para a lista';
                  }
                  return null;
                },
                controller: _nomeController.value,
                decoration: InputDecoration(
                  hintText: 'Nome da lista',
                  hintStyle: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white70
                        : Colors.grey[600],
                  ),
                  prefixIcon: Icon(
                    Icons.list,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Botões
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Criar'),
                    onPressed: () {
                      if (formKey.value.currentState!.validate()) {
                        Navigator.of(
                          context,
                        ).pop(_nomeController.value.text.trim());
                      }
                      // else {

                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text(
                      //       'Por favor, insira um nome para a lista',
                      //     ),
                      //   ),
                      // );
                      // }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nomeController.value.dispose();
    formKey.value.currentState?.dispose();
    super.dispose();
  }
}
