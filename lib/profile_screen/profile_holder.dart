import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/constants/locales.dart';
import 'package:profile/constants/themes.dart';
import 'package:profile/profile_screen/profile_state.dart';

class ProfileHolder extends StateNotifier<ProfileState> {
  ProfileHolder() : super(const ProfileState.initial());

  ProfileState get oState => state;

  void setThemes(Themes theme) {
    state = state.copyWith(themes: theme);
  }

  void setLocales(Locales locale) {
    state = state.copyWith(locales: locale);
  }

  void setCollExperience(bool value) {
    state = state.copyWith(collExperience: value);
  }

  void setCollEducation(bool value) {
    state = state.copyWith(collEducation: value);
  }

  void setCollSkills(bool value) {
    state = state.copyWith(collSkills: value);
  }

  void setCollCourses(bool value) {
    state = state.copyWith(collCourses: value);
  }

  void setCollLang(bool value) {
    state = state.copyWith(collLang: value);
  }

  void setCollHobbies(bool value) {
    state = state.copyWith(collHobbies: value);
  }
}
