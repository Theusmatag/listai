// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:listaai/global/exceptions/failure.dart';
import 'package:listaai/modules/login/domain/repositories/login_repository.dart';

import '../../data/models/registro_model.dart';

class RegistroUseCase {
  final LoginRepository loginRepository;
  RegistroUseCase({required this.loginRepository});

  Future<Either<Failure, RegisterUser>> call(String email, String password) {
    return loginRepository.registro(password, email);
  }
}
