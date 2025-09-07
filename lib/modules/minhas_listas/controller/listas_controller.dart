import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ListasController {
  UniqueKey chaveUnica = UniqueKey();
  RxList<String> listas = <String>[
    'Lista de compras',
    'Lista de tarefas',
    'Lista de livros',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
    'Lista de filmes',
  ].obs;

  void adicionarNaLista(String? nome) {
    if (nome != null && nome.isNotEmpty) {
      listas.add(nome);
    }
  }
}
