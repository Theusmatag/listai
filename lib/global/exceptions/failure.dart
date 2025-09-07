sealed class Failure implements Exception {
  final String message;
  final String? titulo;

  Failure({required this.message, required this.titulo});
}

class UserNotfound extends Failure {
  UserNotfound({required super.message, required super.titulo});
}

class EmailNotConfirmed extends Failure {
  EmailNotConfirmed({required super.message, required super.titulo});
}

class RepositoryFailure extends Failure {
  RepositoryFailure({required super.message, super.titulo});
}

class UnknownError extends Failure {
  UnknownError({required super.message, super.titulo});
}

class ServiceException extends Failure {
  ServiceException({required super.message, super.titulo});
}
