import 'package:dartz/dartz.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/entities/employee_model.dart';
import 'package:mybookstore/domain/repositories/employee_repository.dart';

class EditEmployee implements UseCase<NoParams, CreateEmployeeModel> {
  final EmployeeRepository repository;

  EditEmployee(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(CreateEmployeeModel paramns) async {
    return repository.editEmployee(paramns);
  }
}
