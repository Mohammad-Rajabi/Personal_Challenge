import 'package:finnogate_challenge/src/constants/routes_constant.dart';
import 'package:finnogate_challenge/src/features/auth/presentation/ui/auth_screen.dart';
import 'package:finnogate_challenge/src/common_widgets/main_screen.dart';
import 'package:finnogate_challenge/src/features/dashboard/presentation/ui/dashboard_screen.dart';
import 'package:finnogate_challenge/src/features/splash/presentation/ui/splash_screen.dart';
import 'package:finnogate_challenge/src/features/user/domain/user_model/user_model.dart';
import 'package:finnogate_challenge/src/features/user/presentation/user_profile/user_profile_screen.dart';
import 'package:finnogate_challenge/src/features/user/presentation/users_list/ui/users_list_screen.dart';
import 'package:finnogate_challenge/src/features/web_view/presentation/ui/web_view_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var route;

    switch (settings.name) {
      case kSplashRoute:
        route = MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      case kMainScreenRoute:
        route = MaterialPageRoute(builder: (_) => MainScreen());
        break;
      case kAuthScreenRoute:
        route = MaterialPageRoute(builder: (_) => AuthScreen());
        break;
        case kWebViewScreenRoute:
        route = MaterialPageRoute(builder: (_) => WebViewScreen(url: (settings.arguments) as String));
        break;
      case kUserProfileScreenRoute:
        route = MaterialPageRoute(
          builder: (_) => UserProfileScreen(
            user: (settings.arguments) as UserModel,
          ),
        );
        break;
      case kDashboardScreenRoute:
        route = MaterialPageRoute(builder: (_) => Offstage(offstage:((settings.arguments) as Map<String,dynamic>)['offStage'],child: DashboardScreen(),));
        break;
      case kUsersListScreenRoute:
        route = MaterialPageRoute(
          builder: (_) => Offstage(
            offstage:
                ((settings.arguments) as Map<String, dynamic>)['offStage'],
            child: UsersListScreen(),
          ),
        );
        break;
    }
    return route;
  }
}
