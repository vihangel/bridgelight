part of 'create_book_bloc.dart';

abstract class CreateBookEvent extends Equatable {
  const CreateBookEvent();

  @override
  List<Object> get props => [];
}

class AddBookEvent extends CreateBookEvent {
  final CreateBookModel book;

  const AddBookEvent(this.book);

  @override
  List<Object> get props => [book];
}

class EditBookEvent extends CreateBookEvent {
  final CreateBookModel book;

  const EditBookEvent(this.book);

  @override
  List<Object> get props => [book];
}
