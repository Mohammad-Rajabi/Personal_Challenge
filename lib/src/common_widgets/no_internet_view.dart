import 'package:finnogate_challenge/src/common_widgets/failure_or_noInternet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class NoInternetView extends StatelessWidget {
  const NoInternetView({
    Key? key,
    required this.themeData,
    required this.localizations,
    required this.callback
  }) : super(key: key);

  final ThemeData themeData;
  final AppLocalizations localizations;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        child: FailureOrNoInternetWidget(
          themeData: themeData,
          title: localizations.noInternet,
          buttonText: localizations.retry,
          voidCallback: callback,
          child: const Icon(
            Icons.wifi_off_outlined,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
