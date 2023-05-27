import 'package:dartz/dartz.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/entities/auth_response.dart';
import 'package:mybookstore/domain/repositories/auth_repository.dart';

import '../../../core/utils/failures.dart';

class CheckForLoggedInUser extends UseCase<AuthResponse, NoParams> {
  final AuthRepository repository;

  CheckForLoggedInUser(this.repository);

  @override
  Future<Either<Failure, AuthResponse>> call(NoParams params) {
    return repository.getUser();
  }
}
