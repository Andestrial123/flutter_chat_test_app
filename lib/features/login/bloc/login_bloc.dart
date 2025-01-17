import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_test_app/domain/repositories/auth/auth_repository.dart';

part '../bloc/login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginInitial()) {
    on<LoginSendEvent>(_onLogin);
  }

  FutureOr<void> _onLogin(LoginSendEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      await _authRepository.login(event.username);
      emit(LoginSuccess());
    } catch (e) {
      log('[LoginBloc][_onLogin] $e');
      emit(LoginFailed(e.toString()));
    }
  }
}
