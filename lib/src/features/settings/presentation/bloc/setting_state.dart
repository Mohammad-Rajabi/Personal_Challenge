import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsState extends Equatable {
  ThemeData themeData;

  Locale locale;

  SettingsState(
      {required this.themeData,
      required this.locale});

  SettingsState copyWith({
    ThemeData? themeData,
    Locale? locale,
  }) {
    return SettingsState(
      themeData: themeData ?? this.themeData,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [locale, themeData];
}
