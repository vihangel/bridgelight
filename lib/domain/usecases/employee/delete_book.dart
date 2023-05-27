import 'package:dartz/dartz.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/repositories/employee_repository.dart';

class DeleteEmployee implements UseCase<NoParams, String> {
  final EmployeeRepository repository;

  DeleteEmployee(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(String id) async {
    return repository.deleteEmployee(id);
  }
}
