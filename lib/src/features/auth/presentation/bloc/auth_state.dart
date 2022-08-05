part of 'auth_bloc.dart';

enum AuthStateMode { login, register }

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  late AuthStateMode authStateMode;
  late bool isPasswordObscure;
  late bool isConfirmationPasswordObscure;
  late bool isLoading;
  late bool isRulesAccepted;
  late bool rememberMe;

  AuthInitial(
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

  AuthInitial copyWith(
      {AuthStateMode? authStateMode,
      bool? isLoading,
      bool? isPasswordObscure,
      bool? isConfirmationPasswordObscure,
      bool? isRulesAccepted,
      bool? rememberMe}) {
    return AuthInitial(
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

class AuthNavigatedTo extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthNoInternet extends AuthState {}

class AuthFailure extends AuthState {
  String message;

  AuthFailure({required this.message});
}

class AuthNoRulesAccepted extends AuthState {}
