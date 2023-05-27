abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class GeneralFailure extends Failure {
  GeneralFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message);
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure(String message) : super(message);
}
