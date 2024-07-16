import 'package:flutter/material.dart';
import 'package:profile/constants/locales.dart';
import 'package:profile/constants/themes.dart';

@immutable
class ProfileState {
  final Themes themes;
  final Locales locales;
  final bool collExperience;
  final bool collEducation;
  final bool collSkills;
  final bool collCourses;
  final bool collLang;
  final bool collHobbies;

  bool get isCollapsedAll =>
      collExperience &&
      collEducation &&
      collSkills &&
      collCourses &&
      collLang &&
      collHobbies;

  const ProfileState({
    required this.themes,
    required this.locales,
    required this.collCourses,
    required this.collEducation,
    required this.collExperience,
    required this.collHobbies,
    required this.collLang,
    required this.collSkills,
  });

  const ProfileState.initial()
      : themes = Themes.light,
        locales = Locales.en,
        collCourses = true,
        collEducation = true,
        collExperience = true,
        collHobbies = true,
        collLang = true,
        collSkills = true;

  ProfileState copyWith({
    Themes? themes,
    Locales? locales,
    bool? collExperience,
    bool? collEducation,
    bool? collSkills,
    bool? collCourses,
    bool? collLang,
    bool? collHobbies,
  }) {
    return ProfileState(
      themes: themes ?? this.themes,
      locales: locales ?? this.locales,
      collCourses: collCourses ?? this.collCourses,
      collEducation: collEducation ?? this.collEducation,
      collExperience: collExperience ?? this.collExperience,
      collHobbies: collHobbies ?? this.collHobbies,
      collLang: collLang ?? this.collLang,
      collSkills: collSkills ?? this.collSkills,
    );
  }
}
