part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetListEvent extends HomeEvent {}

class FilterListEvent extends HomeEvent {
  // final AuthModel auth;

  // const AuthLoginEvent({required this.auth});

  // @override
  // List<Object> get props => [auth];
}
