import 'package:flutter/material.dart';
import 'package:profile/constants/locales.dart';
import 'package:profile/constants/themes.dart';

@immutable
class ProfileState {
  final Themes themes;
  final Locales locales;
  final bool isCollapsed;

  const ProfileState({
    required this.themes,
    required this.locales,
    required this.isCollapsed,
  });

  const ProfileState.initial()
      : themes = Themes.light,
        locales = Locales.en,
        isCollapsed = true;

  ProfileState copyWith({Themes? themes, Locales? locales, bool? isCollapsed}) {
    return ProfileState(
      themes: themes ?? this.themes,
      locales: locales ?? this.locales,
      isCollapsed: isCollapsed ?? this.isCollapsed,
    );
  }
}
