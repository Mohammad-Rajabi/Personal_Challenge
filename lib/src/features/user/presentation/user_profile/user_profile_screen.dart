import 'package:cached_network_image/cached_network_image.dart';
import 'package:finnogate_challenge/src/features/user/domain/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserProfileScreen extends StatelessWidget {
  late UserModel _user;
  late ThemeData themeData;
  late AppLocalizations localizations;

  UserProfileScreen({Key? key, required UserModel user})
      : _user = user,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        iconTheme: themeData.iconTheme,
        title: Text(
          localizations.profile,
          style: themeData.textTheme.headline5,
        ),
      ),
      body: Column(
        children: [Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ClipOval(
                child: CachedNetworkImage(
                  width: 100,
                  height: 100,
                  imageUrl: _user.avatar!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_user.firstName!} ${_user.lastName!}',
                  style: themeData.textTheme.headline6,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  _user.email!,
                  style: themeData.textTheme.subtitle2,
                ),
              ],
            )
          ],
        )],
      ),
    );
  }
}
