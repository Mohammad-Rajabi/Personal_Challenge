import 'package:finnogate_challenge/src/features/settings/presentation/bloc/setting_bloc.dart';
import 'package:finnogate_challenge/src/features/settings/presentation/bloc/setting_state.dart';
import 'package:finnogate_challenge/src/themeing/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../bloc/setting_event.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late ThemeData themeData;
  late AppLocalizations localizations;

  @override
  void didChangeDependencies() {
    themeData = Theme.of(context);
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: RepositoryProvider.of<SettingBloc>(context),
      child: BlocBuilder<SettingBloc, SettingsState>(
        builder: (context, state) {
          return PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: themeData.iconTheme.color,
              ),
              onSelected: (String choice) {
                if (choice == localizations.theme) {
                  context
                      .read<SettingBloc>()
                      .add(ThemeChangedEvent(themeData: state.themeData));
                } else {
                  context
                      .read<SettingBloc>()
                      .add(LocalChangedEvent(locale: state.locale));
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: localizations.theme,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          localizations.theme,
                          style: themeData.textTheme.subtitle2,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          checkTheme(state),
                          style: themeData.textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: localizations.language,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          localizations.language,
                          style: themeData.textTheme.subtitle2,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          checkLanguage(state),
                          style: themeData.textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ];
              });
        },
      ),
    );
  }

  String checkTheme(SettingsState state) {
    return state.themeData == appThemeData[AppTheme.Light]
        ? localizations.dark
        : localizations.light;
  }

  String checkLanguage(SettingsState state) {
    return (state.locale.languageCode == 'fa')
        ? localizations.en
        : localizations.fa;
  }
}
