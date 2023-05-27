import 'package:dartz/dartz.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/entities/book_model.dart';
import 'package:mybookstore/domain/repositories/book_repository.dart';

class GetBooks implements UseCase<List<BookModel>, NoParams> {
  final BookRepository repository;

  GetBooks(this.repository);

  @override
  Future<Either<Failure, List<BookModel>>> call(NoParams params) async {
    return repository.getBooks();
  }
}
