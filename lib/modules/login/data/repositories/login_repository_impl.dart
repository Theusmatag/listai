import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:listaai/global/constants/local_storage_keys.dart';
import 'package:listaai/global/exceptions/failure.dart';
import 'package:listaai/modules/login/data/datasources/auth_data_source.dart';
import 'package:listaai/modules/login/data/models/auth_user_model.dart';
import 'package:listaai/modules/login/data/models/registro_model.dart';

import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginDataSource loginDataSource;
  LoginRepositoryImpl({required this.loginDataSource});

  AndroidOptions getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  @override
  Future<Either<Failure, LoginUser>> login(String senha, String email) async {
    try {
      final user = await loginDataSource.login(email, senha);

      final storage = FlutterSecureStorage(aOptions: getAndroidOptions());
      await storage.write(
        key: LocalStorageKeys.accessToken,
        value: user.acessToken,
      );

      return right(user);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, RegisterUser>> registro(
    String senha,
    String email,
  ) async {
    try {
      final user = await loginDataSource.registro(email, senha);
      return right(user);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<void> sair() async {
    final storage = FlutterSecureStorage(aOptions: getAndroidOptions());
    await storage.delete(key: LocalStorageKeys.accessToken);
    await loginDataSource.sair();
  }
}
