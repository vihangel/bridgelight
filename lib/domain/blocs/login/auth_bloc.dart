import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/entities/auth_model.dart';
import 'package:mybookstore/domain/entities/auth_response.dart';
import 'package:mybookstore/domain/entities/create_store_model.dart';
import 'package:mybookstore/domain/usecases/login/auth_create_store.dart';
import 'package:mybookstore/domain/usecases/login/authenticate_user.dart';
import 'package:mybookstore/domain/usecases/login/check_for_logged_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticateUser _authenticateUser;
  final AuthCreateStore _authCreateStore;
  final CheckForLoggedInUser _checkForLoggedInUser;

  AuthResponse? _appUser;
  AuthResponse? get appUser => _appUser;

  ///New bloc structure
  /// 1 - Map handler is here
  /// 2 - We can call and emit inner a function but passing
  AuthBloc(
      this._authenticateUser, this._checkForLoggedInUser, this._authCreateStore)
      : super(AuthInitialState()) {
    on<AuthLoginEvent>((_handleLoginEvent));
    on<CheckForLoggedInUserEvent>((_handleCheckForLoggedInUserEvent));
    on<AuthCreateStoreModel>((_handleCreateStoreModelEvent));
  }

  Future<void> _handleLoginEvent(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());

    final result = await _authenticateUser(event.auth);

    emit(result.fold(
      (error) => AuthErrorState(message: error.message),
      (user) {
        _appUser = user;
        log(
          'User logged in: ${user.user.name} - ${user.user}',
          name: 'AuthBloc',
        );
        return AuthLoadedState(user);
      },
    ));
  }

  Future<void> _handleCheckForLoggedInUserEvent(
    CheckForLoggedInUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());

    final result = await _checkForLoggedInUser(NoParams());

    emit(
      result.fold(
        (_) => UserLoggedOutState(),
        (user) {
          _appUser = user;
          return AuthLoadedState(user);
        },
      ),
    );
  }

  Future<void> _handleCreateStoreModelEvent(
    AuthCreateStoreModel event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());

    ///Warning ver o motivo de não estar criando, entender o erro 500
    final result = await _authCreateStore(event.store);

    emit(result.fold(
      (error) => AuthErrorState(message: error.message),
      (user) {
        _appUser = user;
        log(
          'Store created and logged in: ${user.user.name} - ${user.user}',
          name: 'AuthBloc',
        );
        return AuthLoadedState(user);
      },
    ));
  }
}
