import 'package:profile/constants/constants.dart';
import 'package:profile/profile_screen/profile_holder.dart';

class ProfileManager {
  final ProfileHolder holder;

  const ProfileManager({required this.holder});

  void setThemes(Themes theme) {
    holder.setThemes(theme);
  }

  void setLocales(Locales locale) {
    holder.setLocales(locale);
  }
}
