import 'package:dartz/dartz.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/entities/auth_response.dart';
import 'package:mybookstore/domain/entities/create_store_model.dart';
import 'package:mybookstore/domain/repositories/auth_repository.dart';

class AuthCreateStore implements UseCase<AuthResponse, StoreWithAdminModel> {
  final AuthRepository repository;

  AuthCreateStore(this.repository);

  @override
  Future<Either<Failure, AuthResponse>> call(
      StoreWithAdminModel authModel) async {
    return repository.createStore(authModel);
  }
}
