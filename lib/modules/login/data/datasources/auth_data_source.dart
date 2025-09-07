import 'package:firebase_auth/firebase_auth.dart';
import 'package:listaai/global/exceptions/failure.dart';
import 'package:listaai/modules/login/data/models/auth_user_model.dart';
import 'package:listaai/modules/login/data/models/registro_model.dart';

abstract interface class LoginDataSource {
  Future<LoginUser> login(String email, String senha);

  Future<RegisterUser> registro(String email, String senha);
  Future<void> sair();
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<LoginUser> login(String email, String senha) async {
    try {
      var resp = await FirebaseAuth.instance.signInWithEmailAndPassword(
        password: senha,
        email: email,
      );
      var token = await resp.user!.getIdToken();
      if (resp.user != null) {
        return LoginUser(
          acessToken: token ?? 'null',
          userId: resp.user!.uid,
          email: resp.user!.email!,
        );
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      if (e.message == 'Invalid login credentials') {
        throw UserNotfound(
          message: 'Credenciais inválidas.',
          titulo: 'Não foi possível fazer login',
        );
      }
      if (e.message == 'Email not confirmed') {
        throw EmailNotConfirmed(
          message:
              'Enviamos um link ao seu email, por favor confirme para concluir seu registro.  ',
          titulo: 'Email não confirmado',
        );
      }
      throw e.message!;
    }
  }

  @override
  Future<RegisterUser> registro(String email, String senha) async {
    try {
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        password: senha,
        email: email,
      );
      var teste3 = RegisterUser(
        userId: result.user?.uid ?? '',
        email: result.user?.email ?? '',
      );

      return teste3;
    } on FirebaseAuthException catch (e) {
      throw EmailNotConfirmed(message: e.message ?? ' erro ', titulo: 'erro');
    }
  }

  @override
  Future<void> sair() async {
    return await FirebaseAuth.instance.signOut();
  }
}
