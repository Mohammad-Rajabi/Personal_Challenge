import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:finnogate_challenge/src/features/auth/data/remote_auth_data_source.dart';
import 'package:finnogate_challenge/src/exceptions/NoInternetException.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/connectivity_service.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  RemoteAuthDataSource remoteAuthDataSource;

  AuthBloc({required this.remoteAuthDataSource}) : super(AuthInitial()) {
    on<AuthNavigateToEvent>(_onNavigate);
    on<AuthRequested>(_onRequested);
    on<AuthObscurePasswordChanged>(_onObscurePasswordChanged);
    on<AuthObscureConfirmationPasswordChanged>(
        _onObscureConfirmationPasswordChanged);
    on<AuthRulesAccepted>(_onRulesAccepted);
    on<AuthRememberMe>(_onRememberMe);
    on<AuthStateModeChanged>(_onAuthStateModeChanged);
  }

  _onNavigate(AuthNavigateToEvent event, Emitter<AuthState> emit) {}

  _onRequested(AuthRequested event, Emitter<AuthState> emit) async {
    if (event.formKey.currentState!.validate()) {
      emit((state as AuthInitial).copyWith(isLoading: true));

      if ((state as AuthInitial).authStateMode == AuthStateMode.login) {
        await _login(event, emit);
      } else {
        if ((state as AuthInitial).isRulesAccepted) {
          await _register(event, emit);
        }
        else {
          emit(AuthNoRulesAccepted());
          emit(AuthInitial(
              isLoading: false, authStateMode: AuthStateMode.register));
        }
      }
    }
  }

  Future<void> _login(AuthRequested event, Emitter<AuthState> emit) async {
    try {
      await remoteAuthDataSource.login(
          email: event.email, password: event.password);
      emit(AuthSuccess());
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.other &&
          dioError.error is NoInternetException) {
        emit(AuthNoInternet());
      } else {
        emit(AuthFailure(message: event.localizations.user_not_found));
      }
    } catch (e) {
      emit(AuthFailure(message: event.localizations.exception));
    } finally {
      emit(AuthInitial(
          isLoading: false, authStateMode: AuthStateMode.login));
    }
  }

  Future<void> _register(AuthRequested event, Emitter<AuthState> emit) async {
    try {
      await remoteAuthDataSource.register(
          email: event.email, password: event.password);
      emit(AuthSuccess());
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.other &&
          dioError.error is NoInternetException) {
        emit(AuthNoInternet());
      } else {
        emit(AuthFailure(message: event.localizations.register_error));
      }
    } catch (e) {
      emit(AuthFailure(message: event.localizations.exception));
    } finally {
      emit(AuthInitial(
          isLoading: false, authStateMode: AuthStateMode.register,isRulesAccepted: true));
    }
  }

  _onObscurePasswordChanged(
      AuthObscurePasswordChanged event, Emitter<AuthState> emit) {
    emit((state as AuthInitial).copyWith(
      isPasswordObscure: !event.obscurePassword,
    ));
  }

  _onObscureConfirmationPasswordChanged(
      AuthObscureConfirmationPasswordChanged event, Emitter<AuthState> emit) {
    emit((state as AuthInitial).copyWith(
      isConfirmationPasswordObscure: !event.obscureConfirmationPassword,
    ));
  }

  _onRulesAccepted(AuthRulesAccepted event, Emitter<AuthState> emit) {
    emit((state as AuthInitial)
        .copyWith(isRulesAccepted: event.isRulesAccepted));
  }

  _onAuthStateModeChanged(AuthStateModeChanged event, Emitter<AuthState> emit) {
    emit((state as AuthInitial).copyWith(
        authStateMode: event.authStateMode == AuthStateMode.register
            ? AuthStateMode.login
            : AuthStateMode.register));
  }

   _onRememberMe(AuthRememberMe event, Emitter<AuthState> emit) {
     emit((state as AuthInitial)
         .copyWith(rememberMe: event.rememberMe));
  }
}
