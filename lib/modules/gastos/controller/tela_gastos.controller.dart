import 'package:get/get.dart';
import 'package:listaai/modules/gastos/model/produto_grafico.dart';

class GastosController extends GetxController {
  final RxList<ProdutoGrafico> produtos = <ProdutoGrafico>[
    ProdutoGrafico(nome: 'Banana', preco: 15.50),
    ProdutoGrafico(nome: 'Maçã', preco: 8.90),
    ProdutoGrafico(nome: 'Laranja', preco: 12.30),
    ProdutoGrafico(nome: 'Uva', preco: 25.00),
    ProdutoGrafico(nome: 'Pera', preco: 18.75),
    ProdutoGrafico(nome: 'Kiwi', preco: 32.40),
    ProdutoGrafico(nome: 'Manga', preco: 22.10),
    ProdutoGrafico(nome: 'Tangerina', preco: 25.00),
    ProdutoGrafico(nome: 'Melancia', preco: 18.75),
    ProdutoGrafico(nome: 'Melao', preco: 32.40),
    ProdutoGrafico(nome: 'Jalapao', preco: 22.10),
  ].obs;

  void adicionarProduto(String nome, double preco) {
    produtos.add(ProdutoGrafico(nome: nome, preco: preco));
  }

  void removerProduto(int index) {
    if (index >= 0 && index < produtos.length) {
      produtos.removeAt(index);
    }
  }
}
