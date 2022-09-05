import 'package:finnogate_challenge/src/common_widgets/custom_button.dart';
import 'package:finnogate_challenge/src/common_widgets/custom_snack_bar.dart';
import 'package:finnogate_challenge/src/common_widgets/custom_text_field.dart';
import 'package:finnogate_challenge/src/constants/routes_constant.dart';
import 'package:finnogate_challenge/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:finnogate_challenge/src/routing/app_routes.dart';
import 'package:finnogate_challenge/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  late ThemeData themeData;
  late AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    localizations = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => RepositoryProvider.of<AuthBloc>(context),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          buildWhen: (previous, current) {
            if (current is AuthInitialState) {
              return true;
            } else {
              return false;
            }
          },
          listener: (context, state) {
            if (state is AuthNoInternetState) {
              showSnackBar(context, localizations.noInternet);
            }
            if (state is AuthFailureState) {
              showSnackBar(context, state.message);
            }
            if (state is AuthSuccessState) {
              _emailController.clear();
              _passwordController.clear();
              _passwordConfirmationController.clear();
              // _emailFocusNode.dispose();
              // _passwordFocusNode.dispose();
              // _passwordConfirmationFocusNode.dispose();
              _navigateToMainScreen(context);
            }
            if (state is AutRulesNotAcceptedState) {
              showSnackBar(context, localizations.no_rules_accepted);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: (state as AuthInitialState).authStateMode ==
                        AuthStateMode.register
                    ? _RegisterStateWidget(
                        themeData: themeData,
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordConfirmationController:
                            _passwordConfirmationController,
                        passwordController: _passwordController,
                        localizations: localizations,
                      )
                    : _LoginStateWidget(
                        themeData: themeData,
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        localizations: localizations),
              ),
            );
          },
        ),
      ),
    );
  }

  _navigateToMainScreen(BuildContext context) {
    Navigator.pushReplacement(context,
        AppRoutes.generateRoute(const RouteSettings(name: kMainScreenRoute)));
  }
}

class _LoginStateWidget extends StatelessWidget {
  const _LoginStateWidget(
      {Key? key,
      required this.themeData,
      required GlobalKey<FormState> formKey,
      required TextEditingController emailController,
      required TextEditingController passwordController,
      required AppLocalizations localizations})
      : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController,
        _localizations = localizations,
        super(key: key);

  final ThemeData themeData;
  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final AppLocalizations _localizations;

  @override
  Widget build(BuildContext context) {
    AuthState state = context.read<AuthBloc>().state;
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _localizations.login_to_your_account,
            style: themeData.textTheme.headline4!.copyWith(
              fontSize: 32,
            ),
          ),
          Divider(
            height: 32,
            thickness: 6,
            color: themeData.colorScheme.primary,
            endIndent: MediaQuery.of(context).size.width * 0.65,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    validator: (value) {
                      return emailValidator(value, _localizations);
                    },
                    controller: _emailController,
                    // focusNode: _emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    label: _localizations.email),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    validator: (value) {
                      return passwordValidator(value, _localizations);
                    },
                    controller: _passwordController,
                    // focusNode: _passwordFocusNode,
                    obscureText: (state as AuthInitialState).isPasswordObscure,
                    suffixIcon: IconButton(
                      splashRadius: 24,
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthObscurePasswordChangedEvent(
                            obscurePassword: state.isPasswordObscure));
                      },
                      icon: Icon(
                        state.isPasswordObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    label: _localizations.password),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Checkbox(
                activeColor: themeData.colorScheme.primary,
                value: state.rememberMe,
                onChanged: (bool? value) {
                  context
                      .read<AuthBloc>()
                      .add(AuthRememberMeEvent(rememberMe: value!));
                },
              ),
              Text(
                _localizations.remember_me,
                style: themeData.textTheme.subtitle2,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          CustomButton(
            width: double.infinity,
            height: 60,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            voidCallback: () {
              context.read<AuthBloc>().add(AuthRequestedEvent(
                  formKey: _formKey,
                  email: _emailController.text.trim(),
                  password: _passwordController.text,
                  localizations: _localizations));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: state.isLoading,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: themeData.colorScheme.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(state.authStateMode == AuthStateMode.login
                    ? _localizations.login
                    : _localizations.register)
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _localizations.donot_have_account,
                  style: themeData.textTheme.subtitle1!.copyWith(fontSize: 16),
                ),
                TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      context.read<AuthBloc>().add(AuthStateModeChangedEvent(
                          authStateMode: AuthStateMode.login));
                    },
                    child: Text(
                      _localizations.register,
                      style: themeData.textTheme.headline6!.copyWith(
                          fontSize: 16, color: themeData.colorScheme.primary),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RegisterStateWidget extends StatelessWidget {
  const _RegisterStateWidget(
      {Key? key,
      required this.themeData,
      required GlobalKey<FormState> formKey,
      required TextEditingController emailController,
      required TextEditingController passwordController,
      required TextEditingController passwordConfirmationController,
      required AppLocalizations localizations})
      : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController,
        _passwordConfirmationController = passwordConfirmationController,
        _localizations = localizations,
        super(key: key);

  final ThemeData themeData;
  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _passwordConfirmationController;
  final AppLocalizations _localizations;

  @override
  Widget build(BuildContext context) {
    AuthState state = context.read<AuthBloc>().state;
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _localizations.register_new_account,
            style: themeData.textTheme.headline4!.copyWith(
              fontSize: 32,
            ),
          ),
          Divider(
            height: 32,
            thickness: 6,
            color: themeData.colorScheme.primary,
            endIndent: MediaQuery.of(context).size.width * 0.65,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    validator: (value) {
                      return emailValidator(value, _localizations);
                    },
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: _localizations.email),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    validator: (value) {
                      return passwordValidator(value, _localizations);
                    },
                    controller: _passwordController,
                    obscureText: (state as AuthInitialState).isPasswordObscure,
                    suffixIcon: IconButton(
                      splashRadius: 24,
                      onPressed: () {
                        _formKey.currentState!.reset();
                        context.read<AuthBloc>().add(AuthObscurePasswordChangedEvent(
                            obscurePassword: state.isPasswordObscure));
                      },
                      icon: Icon(
                        state.isPasswordObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    label: _localizations.password),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    validator: (value) {
                      return confirmPasswordValidator(
                          value, _passwordController.text, _localizations);
                    },
                    suffixIcon: IconButton(
                      splashRadius: 24,
                      onPressed: () {
                        context.read<AuthBloc>().add(
                            AuthObscureConfirmationPasswordChangedEvent(
                                obscureConfirmationPassword:
                                    state.isConfirmationPasswordObscure));
                      },
                      icon: Icon(
                        state.isConfirmationPasswordObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    controller: _passwordConfirmationController,
                    obscureText: state.isConfirmationPasswordObscure,
                    keyboardType: TextInputType.text,
                    label: _localizations.confirmation_password),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Checkbox(
                activeColor: themeData.colorScheme.primary,
                value: state.isRulesAccepted,
                onChanged: (bool? value) {
                  context
                      .read<AuthBloc>()
                      .add(AuthRulesAcceptedEvent(isRulesAccepted: value!));
                },
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: _localizations.agree_to_conditions.split('\n').first,
                    style:
                        themeData.textTheme.subtitle1!.copyWith(fontSize: 14),
                  ),
                  const TextSpan(text: '\n'),
                  TextSpan(
                      text: _localizations.agree_to_conditions.split('\n').last,
                      style: themeData.textTheme.subtitle1!
                          .copyWith(color: themeData.colorScheme.primary)),
                ]),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          CustomButton(
            width: double.infinity,
            height: 60,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            voidCallback: () {
              context.read<AuthBloc>().add(AuthRequestedEvent(
                  formKey: _formKey,
                  email: _emailController.text.trim(),
                  password: _passwordController.text,
                  localizations: _localizations));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: state.isLoading,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: themeData.colorScheme.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(state.authStateMode == AuthStateMode.login
                    ? _localizations.login
                    : _localizations.register)
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _localizations.already_have_account,
                  style: themeData.textTheme.subtitle1!.copyWith(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthStateModeChangedEvent(
                        authStateMode: state.authStateMode));
                  },
                  child: Text(
                    _localizations.login,
                    style: themeData.textTheme.headline6!.copyWith(
                        fontSize: 16, color: themeData.colorScheme.primary),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
