import 'package:dartz/dartz.dart';
import 'package:listaai/global/exceptions/failure.dart';
import 'package:listaai/modules/login/data/models/auth_user_model.dart';
import 'package:listaai/modules/login/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;
  LoginUseCase({required this.loginRepository});
  Future<Either<Failure, LoginUser>> call(String email, String password) {
    return loginRepository.login(password, email);
  }
}
