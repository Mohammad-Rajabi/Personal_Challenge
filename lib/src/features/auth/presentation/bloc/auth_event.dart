part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthStateModeChanged extends AuthEvent {
  AuthStateMode authStateMode;
  AuthStateModeChanged({required this.authStateMode});
}

class AuthRequested extends AuthEvent {
  GlobalKey<FormState> formKey;
  String email;
  String password;
  AppLocalizations localizations;

  AuthRequested({required this.formKey,required this.email,required this.password,required this.localizations});
}

class AuthNavigateToEvent extends AuthEvent {}

class AuthObscurePasswordChanged extends AuthEvent {
  bool obscurePassword;

  AuthObscurePasswordChanged({required this.obscurePassword});
}

class AuthObscureConfirmationPasswordChanged extends AuthEvent {
  bool obscureConfirmationPassword;

  AuthObscureConfirmationPasswordChanged(
      {required this.obscureConfirmationPassword});
}

class AuthRulesAccepted extends AuthEvent {
  bool isRulesAccepted;

  AuthRulesAccepted({required this.isRulesAccepted});
}

class AuthRememberMe extends AuthEvent {
  bool rememberMe;

  AuthRememberMe({required this.rememberMe});
}
