import 'package:dartz/dartz.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/entities/book_model.dart';
import 'package:mybookstore/domain/entities/create_book_model.dart';
import 'package:mybookstore/domain/repositories/book_repository.dart';

class CreateBook implements UseCase<BookModel, CreateBookModel> {
  final BookRepository repository;

  CreateBook(this.repository);

  @override
  Future<Either<Failure, BookModel>> call(CreateBookModel params) async {
    return repository.createBook(params);
  }
}
