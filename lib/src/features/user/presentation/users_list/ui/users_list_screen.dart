import 'package:finnogate_challenge/src/common_widgets/failure_view.dart';
import 'package:finnogate_challenge/src/common_widgets/loading_view.dart';
import 'package:finnogate_challenge/src/common_widgets/no_internet_view.dart';
import 'package:finnogate_challenge/src/constants/routes_constant.dart';
import 'package:finnogate_challenge/src/features/settings/presentation/ui/settings_view.dart';
import 'package:finnogate_challenge/src/features/user/domain/user_model/user_model.dart';
import 'package:finnogate_challenge/src/features/user/presentation/users_list/bloc/users_list_bloc.dart';
import 'package:finnogate_challenge/src/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'users_list_success_view.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  late ThemeData themeData;
  late AppLocalizations localizations;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void didChangeDependencies() {
    themeData = Theme.of(context);
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: RepositoryProvider.of<UsersListBloc>(context)
        ..add(UsersListStartedEvent()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          actions: const [
            SettingsView(),
          ],
        ),
        body: PageStorage(
          bucket: bucket,
          child: BlocConsumer<UsersListBloc, UsersListState>(
            buildWhen: (previous, current) {
              if (current is UsersListNavigatedToUserProfileScreenState ||
                  (current is UsersListSuccessState &&
                      current.isUsersFetching)) {
                return false;
              } else {
                return true;
              }
            },
            listener: (context, state) {
              if (state is UsersListNavigatedToUserProfileScreenState) {
                _navigateToProfileScreen(context, state.user);
              }
            },
            builder: (context, state) {
              if (state is UsersListSuccessState) {
                if (state.users.isNotEmpty) {
                  return  UsersListSuccessView(themeData: themeData);
                }
              }
              if (state is UsersListFailureState) {
                return FailureStateView(
                    themeData: themeData, localizations: localizations);
              }
              if (state is UsersListNoInternetState) {
                return NoInternetView(
                  themeData: themeData,
                  localizations: localizations,
                  callback: () {
                    context.read<UsersListBloc>().add(UsersListRetryEvent());
                  },
                );
              } else {
                return LoadingStateView(themeData: themeData);
              }
            },
          ),
        ),
      ),
    );
  }


  _navigateToProfileScreen(BuildContext context, UserModel user) {
    Navigator.push(
        context,
        AppRoutes.generateRoute(
            RouteSettings(name: kUserProfileScreenRoute, arguments: user)));
  }
}
