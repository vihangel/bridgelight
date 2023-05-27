import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/blocs/login/auth_bloc.dart';
import 'package:mybookstore/domain/entities/employee_model.dart';
import 'package:mybookstore/service/employee_service.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<EmployeeModel>>> getEmployees();
  Future<Either<Failure, NoParams>> deleteEmployee(String id);
  Future<Either<Failure, NoParams>> editEmployee(CreateEmployeeModel params);
  Future<Either<Failure, EmployeeModel>> createEmployee(
      CreateEmployeeModel params);
}

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeService service;

  EmployeeRepositoryImpl(this.service);

  @override
  Future<Either<Failure, List<EmployeeModel>>> getEmployees() async {
    try {
      final token = Modular.get<AuthBloc>().appUser?.token;
      log('token: $token');
      final response = await service.getEmployees('Bearer $token');

      log('Loaded');

      return Right(response);
    } on DioError catch (e) {
      log('$e');
      return Left(GeneralFailure('Oops! Something went wrong.'));
    }
  }

  @override
  Future<Either<Failure, NoParams>> deleteEmployee(String id) async {
    try {
      final token = Modular.get<AuthBloc>().appUser?.token;
      log('token: $token');
      await service.deleteEmployee('Bearer $token', id);
      log('Deleted');

      return Right(NoParams());
    } on DioError catch (e) {
      log('$e');
      return Left(GeneralFailure('Oops! Something went wrong.'));
    }
  }

  @override
  Future<Either<Failure, NoParams>> editEmployee(
      CreateEmployeeModel employee) async {
    try {
      final token = Modular.get<AuthBloc>().appUser?.token;
      final id = employee.id;
      employee.id = null;
      log('token: $token, id:$id, employee: ${employee.toJson()}');

      final response =
          await service.editEmployee('Bearer $token', id ?? '', employee);
      log('Edited');

      return Right(NoParams());
    } on DioError catch (e) {
      log('$e');
      return Left(GeneralFailure('Oops! Something went wrong.'));
    }
  }

  @override
  Future<Either<Failure, EmployeeModel>> createEmployee(
      CreateEmployeeModel employee) async {
    try {
      final token = Modular.get<AuthBloc>().appUser?.token;
      log('token: $token');
      log('employee: ${employee.toJson()}');
      final response = await service.createEmployee('Bearer $token', employee);
      log('Created');

      return Right(response);
    } on DioError catch (e) {
      log('$e');
      return Left(GeneralFailure('Oops! Something went wrong.'));
    }
  }
}
