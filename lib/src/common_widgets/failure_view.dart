import 'package:finnogate_challenge/src/common_widgets/failure_or_noInternet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class FailureStateView extends StatelessWidget {
  const FailureStateView({
    Key? key,
    required this.themeData,
    required this.localizations,
  }) : super(key: key);

  final ThemeData themeData;
  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        child: FailureOrNoInternetWidget(
          themeData: themeData,
          title: localizations.exception,
          buttonText: localizations.retry,
          voidCallback: () {},
          child: const Icon(
            Icons.error,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
