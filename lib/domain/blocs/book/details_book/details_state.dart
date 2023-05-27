part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsInitialState extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsLoadedState extends DetailsState {}

class DetailsErrorState extends DetailsState {
  final String message;

  const DetailsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
