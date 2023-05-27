import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/blocs/login/auth_bloc.dart';
import 'package:mybookstore/domain/entities/book_model.dart';
import 'package:mybookstore/domain/entities/create_book_model.dart';
import 'package:mybookstore/service/book_service.dart';

abstract class BookRepository {
  Future<Either<Failure, List<BookModel>>> getBooks();
  Future<Either<Failure, NoParams>> deleteBook(String id);
  Future<Either<Failure, NoParams>> editBook(CreateBookModel params);
  Future<Either<Failure, BookModel>> createBook(CreateBookModel params);
}

class BookRepositoryImpl implements BookRepository {
  final BooksService service;

  BookRepositoryImpl(this.service);

  @override
  Future<Either<Failure, List<BookModel>>> getBooks() async {
    try {
      final token = Modular.get<AuthBloc>().appUser?.token;
      log('token: $token');
      final response = await service.getBooks('Bearer $token');

      log('Carregado');

      return Right(response);
    } on DioError catch (e) {
      log('$e');
      return Left(GeneralFailure('Oops! Parece que algo deu errado.'));
    }
  }

  @override
  Future<Either<Failure, NoParams>> deleteBook(String id) async {
    try {
      final token = Modular.get<AuthBloc>().appUser?.token;
      log('token: $token');
      await service.deleteBook('Bearer $token', id);
      log('Deleted');

      return Right(NoParams());
    } on DioError catch (e) {
      log('$e');
      return Left(GeneralFailure('Oops! Parece que algo deu errado.'));
    }
  }

  @override
  Future<Either<Failure, NoParams>> editBook(CreateBookModel book) async {
    try {
      final token = Modular.get<AuthBloc>().appUser?.token;
      final id = book.id;
      book.id = null;
      log('token: $token, id:$id, bookid: ${book.id}');

      final response = await service.editBook('Bearer $token', id ?? '', book);
      log('Edited');

      return Right(NoParams());
    } on DioError catch (e) {
      log('$e');
      return Left(GeneralFailure('Oops! Parece que algo deu errado.'));
    }
  }

  @override
  Future<Either<Failure, BookModel>> createBook(CreateBookModel book) async {
    try {
      final token = Modular.get<AuthBloc>().appUser?.token;
      log('token: $token');
      log('book: ${book.toJson()}');
      final response = await service.createBook('Bearer $token', book);
      log('Updated');

      return Right(response);
    } on DioError catch (e) {
      log('$e');
      return Left(GeneralFailure('Oops! Parece que algo deu errado.'));
    }
  }
}
