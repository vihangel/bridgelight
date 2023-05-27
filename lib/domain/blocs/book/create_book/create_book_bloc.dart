import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybookstore/domain/entities/create_book_model.dart';
import 'package:mybookstore/domain/usecases/book/create_book.dart';
import 'package:mybookstore/domain/usecases/book/edit_book.dart';

part 'create_book_event.dart';
part 'create_book_state.dart';

class CreateBookBloc extends Bloc<CreateBookEvent, CreateBookState> {
  final CreateBook _createBook;
  final EditBook _editBook;

  CreateBookBloc(this._createBook, this._editBook)
      : super(CreateBookInitialState()) {
    on<AddBookEvent>((_handleCreateEvent));
    on<EditBookEvent>((_handleEditEvent));
  }

  Future<void> _handleCreateEvent(
    AddBookEvent event,
    Emitter<CreateBookState> emit,
  ) async {
    emit(CreateBookLoadingState());
    log('CreateBookLoadingState - CreateBookBloc - _handleGetListEvent');

    final result = await _createBook(event.book);
    emit(result.fold(
      (error) => CreateBookErrorState(message: error.message),
      (book) {
        return CreateBookLoadedState();
      },
    ));
  }

  Future<void> _handleEditEvent(
    EditBookEvent event,
    Emitter<CreateBookState> emit,
  ) async {
    emit(CreateBookLoadingState());
    log('CreateBookLoadingState - CreateBookBloc - _handleGetListEvent');

    final result = await _editBook(event.book);

    emit(result.fold(
      (error) => CreateBookErrorState(message: error.message),
      (book) {
        return CreateBookLoadedState();
      },
    ));
  }
}
