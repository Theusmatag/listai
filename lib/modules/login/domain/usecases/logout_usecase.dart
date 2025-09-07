// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:listaai/modules/login/domain/repositories/login_repository.dart';

class LogoutUsecase {
  LoginRepository loginRepository;
  LogoutUsecase({required this.loginRepository});

  Future<void> call() async {
    loginRepository.sair();
  }
}
