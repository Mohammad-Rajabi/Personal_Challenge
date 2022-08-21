import 'package:finnogate_challenge/src/common_widgets/failure_view.dart';
import 'package:finnogate_challenge/src/common_widgets/loading_view.dart';
import 'package:finnogate_challenge/src/common_widgets/no_internet_view.dart';
import 'package:finnogate_challenge/src/constants/routes_constant.dart';
import 'package:finnogate_challenge/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:finnogate_challenge/src/features/dashboard/presentation/ui/dashboard_success_view.dart';
import 'package:finnogate_challenge/src/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  late ThemeData themeData;
  late AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    localizations = AppLocalizations.of(context)!;

    return BlocProvider.value(
      value: RepositoryProvider.of<DashboardBloc>(context)
        ..add(DashboardStartedEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 16,
              ),
              Text(
                localizations.coin_name,
                style: themeData.textTheme.subtitle2,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                localizations.current_price,
                style: themeData.textTheme.subtitle2,
              ),
              Text(
                localizations.price_change_24h,
                style: themeData.textTheme.subtitle2,
              )
            ],
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<DashboardBloc, DashboardState>(
          buildWhen: (previous, current) {
            if (current is DashboardNavigatedToWebViewScreenState ||
                (current is DashboardSuccessState && current.isCoinsFetching)) {
              return false;
            } else {
              return true;
            }
          },
          listener: (context, state) {
            if (state is DashboardNavigatedToWebViewScreenState) {
              _navigateToWebViewScreen(context, state.url);
            }
          },
          builder: (context, state) {
            if (state is DashboardSuccessState) {
              if (state.coins.isNotEmpty) {
                return DashboardSuccessView(themeData: themeData);
              }
            }
            if (state is DashboardFailureState) {
              return FailureStateView(
                  themeData: themeData, localizations: localizations);
            }
            if (state is DashboardNoInternetState) {
              return NoInternetView(
                themeData: themeData,
                localizations: localizations,
                callback: () {
                  context.read<DashboardBloc>().add(DashboardRetryEvent());
                },
              );
            } else {
              return LoadingStateView(themeData: themeData);
            }
          },
        ),
      ),
    );
  }

  void _navigateToWebViewScreen(BuildContext context, String url) {
    Navigator.push(
        context,
        AppRoutes.generateRoute(
            RouteSettings(name: kWebViewScreenRoute, arguments: url)));
  }
}
