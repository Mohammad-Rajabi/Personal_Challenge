part of 'auth_bloc.dart';

enum AuthStateMode { login, register }

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {
  late AuthStateMode authStateMode;
  late bool isPasswordObscure;
  late bool isConfirmationPasswordObscure;
  late bool isLoading;
  late bool isRulesAccepted;
  late bool rememberMe;

  AuthInitialState(
      {AuthStateMode authStateMode = AuthStateMode.register,
      bool isLoading = false,
      bool isPasswordObscure = true,
      bool isConfirmationPasswordObscure = true,
      bool isRulesAccepted = false,
      bool rememberMe = false}) {
    this.authStateMode = authStateMode;
    this.isLoading = isLoading;
    this.isPasswordObscure = isPasswordObscure;
    this.isConfirmationPasswordObscure = isConfirmationPasswordObscure;
    this.isRulesAccepted = isRulesAccepted;
    this.rememberMe = rememberMe;
  }

  AuthInitialState copyWith(
      {AuthStateMode? authStateMode,
      bool? isLoading,
      bool? isPasswordObscure,
      bool? isConfirmationPasswordObscure,
      bool? isRulesAccepted,
      bool? rememberMe}) {
    return AuthInitialState(
      authStateMode: authStateMode ?? this.authStateMode,
      isLoading: isLoading ?? this.isLoading,
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
      isConfirmationPasswordObscure:
          isConfirmationPasswordObscure ?? this.isConfirmationPasswordObscure,
      isRulesAccepted: isRulesAccepted ?? this.isRulesAccepted,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  List<Object?> get props => [
        authStateMode,
        isLoading,
        isPasswordObscure,
        isConfirmationPasswordObscure,
        isRulesAccepted,
        rememberMe
      ];
}

class AuthNavigatedToMainScreenState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthNoInternetState extends AuthState {}

class AuthFailureState extends AuthState {
  String message;

  AuthFailureState({required this.message});
}

class AutRulesNotAcceptedState extends AuthState {}
