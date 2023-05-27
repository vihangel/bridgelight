import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/entities/book_model.dart';
import 'package:mybookstore/domain/usecases/book/get_books.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBooks _getBooks;

  HomeBloc(this._getBooks) : super(HomeInitialState()) {
    on<GetListEvent>((_handleGetListEvent));
  }

  List<BookModel>? _appBooks;
  List<BookModel>? get appBooks => _appBooks;

  Future<void> _handleGetListEvent(
    GetListEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());

    final result = await _getBooks(NoParams());

    emit(result.fold(
      (error) => HomeErrorState(message: error.message),
      (book) {
        _appBooks = book;

        return HomeLoadedState(book);
      },
    ));
  }
}
