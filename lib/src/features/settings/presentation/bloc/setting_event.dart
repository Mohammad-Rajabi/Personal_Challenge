import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class ThemeChangedEvent extends SettingEvent{
  final ThemeData themeData;

  ThemeChangedEvent({
    required this.themeData,
  });
}

class LocalChangedEvent extends SettingEvent{
  final Locale locale;

  LocalChangedEvent({
    required this.locale,
  });
}