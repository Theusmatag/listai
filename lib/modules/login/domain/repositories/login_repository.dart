import 'package:dartz/dartz.dart';
import 'package:listaai/global/exceptions/failure.dart';
import 'package:listaai/modules/login/data/models/auth_user_model.dart';
import 'package:listaai/modules/login/data/models/registro_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginUser>> login(String senha, String email);
  Future<Either<Failure, RegisterUser>> registro(String senha, String email);
  Future sair();
}
