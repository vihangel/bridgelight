import 'package:dartz/dartz.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/entities/auth_model.dart';
import 'package:mybookstore/domain/entities/auth_response.dart';
import 'package:mybookstore/domain/repositories/auth_repository.dart';

class AuthenticateUser implements UseCase<AuthResponse, AuthModel> {
  final AuthRepository repository;

  AuthenticateUser(this.repository);

  @override
  Future<Either<Failure, AuthResponse>> call(AuthModel authModel) async {
    return repository.authenticateUser(authModel);
  }
}
