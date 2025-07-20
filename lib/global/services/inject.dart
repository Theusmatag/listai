import 'package:get_it/get_it.dart';
import 'package:listaai/modules/login/controller/login_controller.dart';

class Inject {
  static final Inject instance = Inject._();

  Inject._();

  Future<void> init() async {
    GetIt.I.registerFactory<LoginController>(() => LoginController());
  }
}
