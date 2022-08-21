part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthStateModeChangedEvent extends AuthEvent {
  AuthStateMode authStateMode;
  AuthStateModeChangedEvent({required this.authStateMode});
}

class AuthRequestedEvent extends AuthEvent {
  GlobalKey<FormState> formKey;
  String email;
  String password;
  AppLocalizations localizations;

  AuthRequestedEvent({required this.formKey,required this.email,required this.password,required this.localizations});
}

class AuthNavigateToMainScreenEvent extends AuthEvent {}

class AuthObscurePasswordChangedEvent extends AuthEvent {
  bool obscurePassword;

  AuthObscurePasswordChangedEvent({required this.obscurePassword});
}

class AuthObscureConfirmationPasswordChangedEvent extends AuthEvent {
  bool obscureConfirmationPassword;

  AuthObscureConfirmationPasswordChangedEvent(
      {required this.obscureConfirmationPassword});
}

class AuthRulesAcceptedEvent extends AuthEvent {
  bool isRulesAccepted;

  AuthRulesAcceptedEvent({required this.isRulesAccepted});
}

class AuthRememberMeEvent extends AuthEvent {
  bool rememberMe;

  AuthRememberMeEvent({required this.rememberMe});
}
