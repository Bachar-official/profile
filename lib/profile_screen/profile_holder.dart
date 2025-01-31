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

  void setIsCollapsed(bool isCollapsed) {
    state = state.copyWith(isCollapsed: isCollapsed);
  }

  void setIsLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
