import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:listaai/modules/minhas_listas/model/produto.dart';

class ListasDetalhesController {
  RxBool carregamento = false.obs;

  RxBool editandoLista = false.obs;

  RxBool comprasIniciadas = false.obs;

  Rx<TipoAcao> tipoAcao = TipoAcao.nulo.obs;

  Rx<TipoAcaoProduto> tipoAcaoProduto = TipoAcaoProduto.nulo.obs;

  final RxList<Produto> produtos = <Produto>[
    Produto(nome: 'Banana', preco: 10.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Maçã', preco: 20.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Laranja', preco: 5.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Uva', preco: 12, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Pera', preco: 2, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Kiwi', preco: 1, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Manga', preco: 10.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Manga', preco: 10.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Manga', preco: 10.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Manga', preco: 10.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Manga', preco: 10.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Manga', preco: 10.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Manga', preco: 10.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Manga', preco: 10.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Manga', preco: 10.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Manga', preco: 10.0, estado: TipoAcaoProduto.nulo),
    Produto(nome: 'Manga', preco: 10.0, estado: TipoAcaoProduto.nulo),
  ].obs;

  void trocarAcaoProduto(int itemDaLista) {
    switch (produtos[itemDaLista].estado) {
      case TipoAcaoProduto.nulo:
        produtos[itemDaLista].estado = TipoAcaoProduto.comprado;
        produtos.refresh();
        break;
      case TipoAcaoProduto.comprado:
        produtos[itemDaLista].estado = TipoAcaoProduto.removido;
        produtos.refresh();
        break;
      case TipoAcaoProduto.removido:
        produtos[itemDaLista].estado = TipoAcaoProduto.nulo;
        produtos.refresh();
        break;
    }
  }

  Widget trocarIconeProduto(TipoAcaoProduto estadoAtual) {
    switch (estadoAtual) {
      case TipoAcaoProduto.nulo:
        return SizedBox(
          width: 32,
          height: 32,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 12,
            ),
          ),
        );

      case TipoAcaoProduto.comprado:
        return const SizedBox(
          width: 32,
          height: 32,
          child: CircleAvatar(
            backgroundColor: Colors.greenAccent,
            radius: 16,
            child: Icon(Icons.check, color: Colors.white, size: 18),
          ),
        );

      case TipoAcaoProduto.removido:
        return const SizedBox(
          width: 32,
          height: 32,
          child: CircleAvatar(
            backgroundColor: Colors.redAccent,
            radius: 16,
            child: Icon(Icons.close, color: Colors.white, size: 18),
          ),
        );
    }
  }

  iniciarCompras() {
    comprasIniciadas.value = true;
  }
}

enum TipoAcao { adicionar, editar, remover, nulo }

enum TipoAcaoProduto { comprado, removido, nulo }
