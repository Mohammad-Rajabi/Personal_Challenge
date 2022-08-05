import 'package:finnogate_challenge/app.dart';
import 'package:finnogate_challenge/life_cycle.dart';
import 'package:finnogate_challenge/src/constants/general_constant.dart';
import 'package:finnogate_challenge/src/features/auth/data/remote_auth_data_source.dart';
import 'package:finnogate_challenge/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:finnogate_challenge/src/features/dashboard/data/remote_user_date_source.dart';
import 'package:finnogate_challenge/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:finnogate_challenge/src/features/settings/presentation/bloc/setting_bloc.dart';
import 'package:finnogate_challenge/src/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:finnogate_challenge/src/features/user/data/remote_user_date_source.dart';
import 'package:finnogate_challenge/src/features/user/presentation/users_list/bloc/users_list_bloc.dart';
import 'package:finnogate_challenge/src/utils/http_client_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await _startSetup();
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider(
      create: (context) => HttpClientService(),
      lazy: true,
    ),
    RepositoryProvider(
      create: (context) => RemoteAuthDataSource(
          httpClientService: RepositoryProvider.of<HttpClientService>(context)),
      lazy: true,
    ),
    RepositoryProvider(
      create: (context) => RemoteUserDataSource(
          httpClientService: RepositoryProvider.of<HttpClientService>(context)),
      lazy: true,
    ),
    RepositoryProvider(
      create: (context) => RemoteCoinsDataSource(
          httpClientService: RepositoryProvider.of<HttpClientService>(context)),
      lazy: true,
    ),
    RepositoryProvider(
      create: (context) => SplashBloc(),
      lazy: true,
    ),
    RepositoryProvider(
      create: (context) => AuthBloc(
          remoteAuthDataSource:
              RepositoryProvider.of<RemoteAuthDataSource>(context)),
      lazy: true,
    ),
    RepositoryProvider(
      create: (context) => SettingBloc(),
      lazy: true,
    ),
    RepositoryProvider(
      create: (context) => UsersListBloc(
          remoteUserDataSource:
              RepositoryProvider.of<RemoteUserDataSource>(context)),
      lazy: true,
    ),
    RepositoryProvider(
      create: (context) => DashboardBloc(
          remoteCoinsDataSource:
              RepositoryProvider.of<RemoteCoinsDataSource>(context)),
      lazy: true,
    ),
  ], child: LifeCycle(child: const App())));
}

Future<void> _startSetup() async {
  await GetStorage.init(kBoxName);
}
