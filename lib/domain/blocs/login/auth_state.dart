part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  final AuthResponse user;

  const AuthLoadedState(this.user);

  @override
  List<Object> get props => [user];
}

class UserLoggedOutState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  const AuthErrorState({this.message = 'Error'});

  @override
  List<Object> get props => [message];
}
