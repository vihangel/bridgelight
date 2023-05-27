part of 'create_book_bloc.dart';

abstract class CreateBookState extends Equatable {
  const CreateBookState();

  @override
  List<Object> get props => [];
}

class CreateBookInitialState extends CreateBookState {}

class CreateBookLoadingState extends CreateBookState {}

class CreateBookLoadedState extends CreateBookState {}

class CreateBookErrorState extends CreateBookState {
  final String message;

  const CreateBookErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
