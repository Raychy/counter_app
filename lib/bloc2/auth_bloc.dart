import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_login);

    on<AuthLogoutRequested>(_logout);
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
  }
}

void _login(AuthLoginRequested event, Emitter<AuthState> emit) async {
  emit(AuthLoading());
  try {
    final email = event.email;
    final password = event.password;
    if (password.length < 6) {
      return emit(AuthFailure('Password cannot be less that 6 characters'));
    }
    await Future.delayed(const Duration(seconds: 1), () {
      return emit(AuthSuccess('$email-$password'));
    });
  } catch (err) {
    return emit(AuthFailure(err.toString()));
  }
}

void _logout(AuthLogoutRequested event, Emitter<AuthState> emit) async {
  emit(AuthLoading());
  try {
    await Future.delayed(const Duration(seconds: 1), () {
      return emit(AuthInitial());
    });
  } catch (err) {
    return emit(AuthFailure(err.toString()));
  }
}
