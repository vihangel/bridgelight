import 'package:dartz/dartz.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/entities/create_book_model.dart';
import 'package:mybookstore/domain/repositories/book_repository.dart';

class EditBook implements UseCase<NoParams, CreateBookModel> {
  final BookRepository repository;

  EditBook(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(CreateBookModel paramns) async {
    return repository.editBook(paramns);
  }
}
