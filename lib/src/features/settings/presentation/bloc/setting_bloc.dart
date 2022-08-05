import 'package:finnogate_challenge/src/constants/general_constant.dart';
import 'package:finnogate_challenge/src/features/settings/presentation/bloc/setting_event.dart';
import 'package:finnogate_challenge/src/features/settings/presentation/bloc/setting_state.dart';
import 'package:finnogate_challenge/src/themeing/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class SettingBloc extends Bloc<SettingEvent, SettingsState> {
  static final box = GetStorage(kBoxName);

  SettingBloc()
      : super(SettingsState(
            themeData: appThemeData[getAppTheme()]!, locale: getLocale())) {
    on<ThemeChanged>(_onThemeChanged);
    on<LocalChanged>(_onLocalChanged);
  }

  //change theme
  _onThemeChanged(ThemeChanged event, Emitter<SettingsState> emit) {
    String changedTheme = changeTheme(event.themeData);
    box.write(kThemeKey, changedTheme);
    emit(state.copyWith(
        themeData: appThemeData[changedTheme== kLightTheme?AppTheme.Light:AppTheme.Dark]));
  }

  String changeTheme(ThemeData themeData) {
    return (themeData == appThemeData[AppTheme.Light])
        ? kDarkTheme
        : kLightTheme;
  }

  static AppTheme getAppTheme() {
    var str =box.hasData(kThemeKey);
    if(box.hasData(kThemeKey)){
      return box.read(kThemeKey)  == kLightTheme
          ? AppTheme.Light
          : AppTheme.Dark;
    }else{
      return AppTheme.Light;
    }
  }

  //change locale
  _onLocalChanged(LocalChanged event, Emitter<SettingsState> emit) {
    String changedLocale = changeLocale(event.locale);

    box.write(kLocaleKey, changedLocale);
    emit(state.copyWith(locale: Locale(changedLocale)));
  }

  String changeLocale(Locale locale) {
    return (locale.languageCode == 'fa') ? 'en' : 'fa';
  }


  static Locale getLocale() {
    return box.hasData(kLocaleKey) ? Locale(box.read(kLocaleKey)) : const Locale('en');
  }
}
