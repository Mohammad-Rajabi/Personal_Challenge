import 'package:equatable/equatable.dart';
import 'package:finnogate_challenge/src/themeing/app_theme.dart';
import 'package:flutter/material.dart';

class SettingEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class ThemeChanged extends SettingEvent{
  final ThemeData themeData;

  ThemeChanged({
    required this.themeData,
  });
}

class LocalChanged extends SettingEvent{
  final Locale locale;

  LocalChanged({
    required this.locale,
  });
}