part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final AuthModel auth;

  const AuthLoginEvent({required this.auth});

  @override
  List<Object> get props => [auth];
}

class AuthCreateStoreModel extends AuthEvent {
  final StoreWithAdminModel store;

  const AuthCreateStoreModel({required this.store});

  @override
  List<Object> get props => [store];
}

class CheckForLoggedInUserEvent extends AuthEvent {}
