import 'package:listaai/modules/minhas_listas/controller/listas_detalhes_controller.dart';

class Produto {
  String nome;
  num preco;
  TipoAcaoProduto estado;

  Produto({
    required this.nome,
    required this.preco,
    this.estado = TipoAcaoProduto.nulo,
  });
}
