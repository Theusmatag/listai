import 'package:get_it/get_it.dart';
import 'package:listaai/modules/login/controller/login_controller.dart';
import 'package:listaai/modules/login/data/datasources/auth_data_source.dart';
import 'package:listaai/modules/login/data/repositories/login_repository_impl.dart';
import 'package:listaai/modules/login/domain/repositories/login_repository.dart';
import 'package:listaai/modules/login/domain/usecases/login_usecase.dart';
import 'package:listaai/modules/minhas_listas/controller/listas_detalhes_controller.dart';

import '../../modules/gastos/controller/tela_gastos.controller.dart';
import '../../modules/inicio/controller/inicio_controller.dart';
import '../../modules/minhas_listas/controller/listas_controller.dart';
import '../../modules/perfil/controller/perfil_controller.dart';
import '../../modules/premium/controller/premium_controller.dart';
import '../../modules/tela_base/controller/base_controller.dart';

class Inject {
  static final Inject instance = Inject._();

  Inject._();

  Future<void> init() async {
    GetIt.I.registerFactory<LoginController>(
      () => LoginController(entrarUseCase: GetIt.I.get<LoginUseCase>()),
    );
    GetIt.I.registerFactory<BaseController>(() => BaseController());
    GetIt.I.registerFactory<InicioController>(() => InicioController());
    GetIt.I.registerFactory<ListasController>(() => ListasController());
    GetIt.I.registerFactory<GastosController>(() => GastosController());
    GetIt.I.registerFactory<PremiumController>(() => PremiumController());
    GetIt.I.registerFactory<PerfilController>(() => PerfilController());
    GetIt.I.registerFactory<ListasDetalhesController>(
      () => ListasDetalhesController(),
    );

    GetIt.I.registerFactory<LoginDataSourceImpl>(() => LoginDataSourceImpl());
    GetIt.I.registerFactory<LoginRepositoryImpl>(
      () => LoginRepositoryImpl(
        loginDataSource: GetIt.I.get<LoginDataSourceImpl>(),
      ),
    );
    GetIt.I.registerFactory<LoginUseCase>(
      () => LoginUseCase(loginRepository: GetIt.I.get<LoginRepositoryImpl>()),
    );
  }
}
