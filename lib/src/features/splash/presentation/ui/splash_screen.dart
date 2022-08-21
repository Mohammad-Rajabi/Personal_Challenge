import 'package:finnogate_challenge/gen/assets.gen.dart';
import 'package:finnogate_challenge/src/constants/routes_constant.dart';
import 'package:finnogate_challenge/src/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:finnogate_challenge/src/routing/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  late ThemeData themeData;
  late AppLocalizations localizations;

  SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
   localizations = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => RepositoryProvider.of<SplashBloc>(context),
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigatedToAuthScreenState) {
            Navigator.pushReplacement(
                context,
                AppRoutes.generateRoute(
                    const RouteSettings(name: kAuthScreenRoute)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: themeData.colorScheme.background,
            body: _splashBody(context),
          );
        },
      ),
    );
  }

  Widget _splashBody(BuildContext context) {

    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox.fromSize(
                size: Size.fromHeight(MediaQuery.of(context).size.height * 0.6),
                child: Assets.images.splashBg
                    .image(fit: BoxFit.cover, alignment: Alignment.center),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              localizations.splash_content,
              style: themeData.textTheme.headline4!
                  .copyWith(fontWeight: FontWeight.w900),
              maxLines: 4,
              textScaleFactor: 1.5,
            ),
            const Spacer(),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: TextButton(
                onPressed: () {
                  context.read<SplashBloc>().add(SplashNavigateToAuthScreenEvent());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(localizations.create_portfolio),
                    Icon(
                      CupertinoIcons.arrow_up_right,
                      color: themeData.colorScheme.primary,
                      size: 18,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
