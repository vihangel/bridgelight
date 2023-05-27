import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/domain/entities/auth_model.dart';
import 'package:mybookstore/domain/entities/auth_response.dart';
import 'package:mybookstore/domain/entities/create_store_model.dart';
import 'package:mybookstore/service/auth_service.dart';

import '../../auth/data/datasources/auth_local_datasouce.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> authenticateUser(AuthModel authModel);

  Future<Either<Failure, AuthResponse>> getUser();

  Future<Either<Failure, AuthResponse>> createStore(
      StoreWithAdminModel storeModel);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;
  final HiveInterface hive = Hive;
  final AppAuthLocalDataSource authLocalDataSource =
      AppAuthLocalDataSource(hive: Hive);

  AuthRepositoryImpl(this.authService);

  @override
  Future<Either<Failure, AuthResponse>> authenticateUser(
      AuthModel authModel) async {
    try {
      final response = await authService.authenticateUser(authModel);
      log('response: $response');
      final authResponse = AuthResponse.fromJson(response);
      log('Is an AuthResponse');

      await authLocalDataSource.cacheUserData(authResponse);
      return Right(authResponse);
    } on DioError catch (e) {
      log('$e');
      return Left(GeneralFailure(
          'Oops! Parece que algo deu errado. Verifique seu nome de usuário e senha e tente novamente.'));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> getUser() async {
    try {
      final user = await authLocalDataSource.getLoggedInUser();

      return Right(user);
    } catch (e) {
      return Left(GeneralFailure('Erro ao buscar usuário logado'));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> createStore(
      StoreWithAdminModel storeModel) async {
    try {
      final response = await authService.createStore(storeModel);
      log('response: $response');
      final authResponse = AuthResponse.fromJson(response);

      await authLocalDataSource.cacheUserData(authResponse);
      log('Created Store and done login');
      return Right(authResponse);
    } on DioError catch (e) {
      log('$e ${e.response}');
      return Left(GeneralFailure(
          'Oops! Parece que algo deu errado. tente novamente mais tarde.'));
    }
  }
}
