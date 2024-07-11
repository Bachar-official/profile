import 'package:flutter/material.dart';
import 'package:profile/constants/locales.dart';
import 'package:profile/constants/themes.dart';

@immutable
class ProfileState {
  final Themes themes;
  final Locales locales;

  const ProfileState({
    required this.themes,
    required this.locales,
  });

  const ProfileState.initial()
      : themes = Themes.light,
        locales = Locales.en;

  ProfileState copyWith({
    Themes? themes,
    Locales? locales,
  }) {
    return ProfileState(
      themes: themes ?? this.themes,
      locales: locales ?? this.locales,
    );
  }
}
