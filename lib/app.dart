import 'package:finnogate_challenge/src/constants/general_constant.dart';
import 'package:finnogate_challenge/src/features/settings/presentation/bloc/setting_bloc.dart';
import 'package:finnogate_challenge/src/features/settings/presentation/bloc/setting_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'src/constants/routes_constant.dart';
import 'src/routing/app_routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepositoryProvider.of<SettingBloc>(context),
      child: BlocBuilder<SettingBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            initialRoute: kSplashRoute,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        },
      ),
    );
  }
}
