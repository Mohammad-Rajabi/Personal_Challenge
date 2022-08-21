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

  AuthBloc({required this.remoteAuthDataSource}) : super(AuthInitialState()) {
    on<AuthNavigateToMainScreenEvent>(_onNavigate);
    on<AuthRequestedEvent>(_onRequested);
    on<AuthObscurePasswordChangedEvent>(_onObscurePasswordChanged);
    on<AuthObscureConfirmationPasswordChangedEvent>(
        _onObscureConfirmationPasswordChanged);
    on<AuthRulesAcceptedEvent>(_onRulesAccepted);
    on<AuthRememberMeEvent>(_onRememberMe);
    on<AuthStateModeChangedEvent>(_onAuthStateModeChanged);
  }

  _onNavigate(AuthNavigateToMainScreenEvent event, Emitter<AuthState> emit) {}

  _onRequested(AuthRequestedEvent event, Emitter<AuthState> emit) async {
    if (event.formKey.currentState!.validate()) {
      emit((state as AuthInitialState).copyWith(isLoading: true));

      if ((state as AuthInitialState).authStateMode == AuthStateMode.login) {
        await _login(event, emit);
      } else {
        if ((state as AuthInitialState).isRulesAccepted) {
          await _register(event, emit);
        }
        else {
          emit(AutRulesNotAcceptedState());
          emit(AuthInitialState(
              isLoading: false, authStateMode: AuthStateMode.register));
        }
      }
    }
  }

  Future<void> _login(AuthRequestedEvent event, Emitter<AuthState> emit) async {
    try {
      await remoteAuthDataSource.login(
          email: event.email, password: event.password);
      emit(AuthSuccessState());
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.other &&
          dioError.error is NoInternetException) {
        emit(AuthNoInternetState());
      } else {
        emit(AuthFailureState(message: event.localizations.user_not_found));
      }
    } catch (e) {
      emit(AuthFailureState(message: event.localizations.exception));
    } finally {
      emit(AuthInitialState(
          isLoading: false, authStateMode: AuthStateMode.login));
    }
  }

  Future<void> _register(AuthRequestedEvent event, Emitter<AuthState> emit) async {
    try {
      await remoteAuthDataSource.register(
          email: event.email, password: event.password);
      emit(AuthSuccessState());
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.other &&
          dioError.error is NoInternetException) {
        emit(AuthNoInternetState());
      } else {
        emit(AuthFailureState(message: event.localizations.register_error));
      }
    } catch (e) {
      emit(AuthFailureState(message: event.localizations.exception));
    } finally {
      emit(AuthInitialState(
          isLoading: false, authStateMode: AuthStateMode.register,isRulesAccepted: true));
    }
  }

  _onObscurePasswordChanged(
      AuthObscurePasswordChangedEvent event, Emitter<AuthState> emit) {
    emit((state as AuthInitialState).copyWith(
      isPasswordObscure: !event.obscurePassword,
    ));
  }

  _onObscureConfirmationPasswordChanged(
      AuthObscureConfirmationPasswordChangedEvent event, Emitter<AuthState> emit) {
    emit((state as AuthInitialState).copyWith(
      isConfirmationPasswordObscure: !event.obscureConfirmationPassword,
    ));
  }

  _onRulesAccepted(AuthRulesAcceptedEvent event, Emitter<AuthState> emit) {
    emit((state as AuthInitialState)
        .copyWith(isRulesAccepted: event.isRulesAccepted));
  }

  _onAuthStateModeChanged(AuthStateModeChangedEvent event, Emitter<AuthState> emit) {
    emit((state as AuthInitialState).copyWith(
        authStateMode: event.authStateMode == AuthStateMode.register
            ? AuthStateMode.login
            : AuthStateMode.register));
  }

   _onRememberMe(AuthRememberMeEvent event, Emitter<AuthState> emit) {
     emit((state as AuthInitialState)
         .copyWith(rememberMe: event.rememberMe));
  }
}
