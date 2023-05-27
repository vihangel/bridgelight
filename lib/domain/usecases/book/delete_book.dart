import 'package:dartz/dartz.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/repositories/book_repository.dart';

class DeleteBook implements UseCase<NoParams, String> {
  final BookRepository repository;

  DeleteBook(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(String id) async {
    return repository.deleteBook(id);
  }
}
