import 'package:finnogate_challenge/src/constants/routes_constant.dart';
import 'package:finnogate_challenge/src/features/dashboard/presentation/ui/dashboard_screen.dart';
import 'package:finnogate_challenge/src/routing/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final int kDashboardScreenIndex = 1;
  final int kUsersListScreenIndex = 0;

  final GlobalKey<NavigatorState> dashboardScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> usersListScreenKey = GlobalKey();

  late int _currentScreenIndex;
  late final _indexToKeyMap;
  late ThemeData themeData;
  late AppLocalizations localizations;
  final Set<int> _screensHistory = {};

  @override
  void initState() {
    super.initState();
    _currentScreenIndex = kUsersListScreenIndex;

    _indexToKeyMap = {
      kDashboardScreenIndex: dashboardScreenKey,
      kUsersListScreenIndex: usersListScreenKey
    };
  }

  Future<bool> _onWillPop() async {
    var currentNavigatorState = _indexToKeyMap[_currentScreenIndex]!.currentState;
    if (currentNavigatorState!.canPop()) {
      currentNavigatorState.pop();
      return false;
    } else if (_screensHistory.isNotEmpty) {
      setState(() {
        _currentScreenIndex = _screensHistory.last;
        _screensHistory.remove(_screensHistory.last);
      });
      return false;
    } else {
      return true;
    }
  }

  @override
  void didChangeDependencies() {
    themeData = Theme.of(context);
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: IndexedStack(
          index: _currentScreenIndex,
          children: [
            _navigator(
                key: usersListScreenKey,
                routeName: kUsersListScreenRoute,
                screenIndex: kUsersListScreenIndex,
                currentIndex: _currentScreenIndex),
            _navigator(
                key: dashboardScreenKey,
                routeName: kDashboardScreenRoute,
                screenIndex: kDashboardScreenIndex,
                currentIndex: _currentScreenIndex),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 12,
          currentIndex: _currentScreenIndex,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(
                  CupertinoIcons.person_2,
                ),
                label: localizations.users_list),
            BottomNavigationBarItem(
                icon: const Icon(
                  CupertinoIcons.home,
                ),
                label: localizations.dashboard),
          ],
          onTap: (selectedScreenIndex) {
            setState(() {
              _screensHistory.add(_currentScreenIndex);
              _currentScreenIndex = selectedScreenIndex;
            });
          },
        ),
      ),
    );
  }

  Widget _navigator(
      {required GlobalKey key,
      required String routeName,
      required int screenIndex,
      required int currentIndex}) {
    return (key.currentState == null && screenIndex != currentIndex)
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => AppRoutes.generateRoute(
              RouteSettings(
                name: routeName,
                arguments: {'offStage': screenIndex != currentIndex},
              ),
            ),
          );
  }
}
