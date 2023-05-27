import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybookstore/domain/usecases/book/delete_book.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final DeleteBook _deleteBook;

  DetailsBloc(this._deleteBook) : super(DetailsInitialState()) {
    on<DeleteBookEvent>((_handleDeleteEvent));
  }

  Future<void> _handleDeleteEvent(
    DeleteBookEvent event,
    Emitter<DetailsState> emit,
  ) async {
    emit(DetailsLoadingState());
    log('DetailsLoadingState - DetailsBloc - _handleGetListEvent');

    final result = await _deleteBook(event.id);

    emit(result.fold(
      (error) => DetailsErrorState(message: error.message),
      (book) {
        return DetailsLoadedState();
      },
    ));
  }
}
