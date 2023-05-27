import 'package:dartz/dartz.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/entities/employee_model.dart';
import 'package:mybookstore/domain/repositories/employee_repository.dart';

class CreateEmployee implements UseCase<EmployeeModel, CreateEmployeeModel> {
  final EmployeeRepository repository;

  CreateEmployee(this.repository);

  @override
  Future<Either<Failure, EmployeeModel>> call(
      CreateEmployeeModel params) async {
    return repository.createEmployee(params);
  }
}
