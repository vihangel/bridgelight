import 'package:dartz/dartz.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/entities/employee_model.dart';
import 'package:mybookstore/domain/repositories/employee_repository.dart';

class GetEmployee implements UseCase<List<EmployeeModel>, NoParams> {
  final EmployeeRepository repository;

  GetEmployee(this.repository);

  @override
  Future<Either<Failure, List<EmployeeModel>>> call(NoParams params) async {
    return repository.getEmployees();
  }
}
