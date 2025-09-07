import 'package:get/get.dart';

import '../../gastos/telas/tela_gastos.dart';
import '../../inicio/presenters/tela_inicial.dart';
import '../../minhas_listas/telas/tela_listas.dart';
import '../../perfil/telas/tela_perfil.dart';
import '../../premium/telas/tela_premium.dart';

class BaseController {
  RxInt indexAtual = 0.obs;
  RxList telas = [
    TelaInicio(),
    TelaListas(),
    TelaGastos(),
    TelaPremium(),
    TelaPerfil(),
  ].obs;
}
