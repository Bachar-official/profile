import 'package:flutter/material.dart';
import 'package:profile/constants/constants.dart';
import 'package:profile/profile_screen/profile_holder.dart';

class ProfileManager {
  final ProfileHolder holder;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey;

  ProfileManager({required this.holder, required this.scaffoldKey});

  final ExpansionTileController experienceC = ExpansionTileController();
  final ExpansionTileController educationC = ExpansionTileController();
  final ExpansionTileController skillsC = ExpansionTileController();
  final ExpansionTileController coursesC = ExpansionTileController();
  final ExpansionTileController langC = ExpansionTileController();
  final ExpansionTileController hobbiesC = ExpansionTileController();

  void setThemes(Themes theme) {
    final expandState = saveState();
    holder.setThemes(theme);
    restoreState(expandState);
  }

  void setLocales(Locales locale) {
    final expandState = saveState();
    holder.setLocales(locale);
    restoreState(expandState);
  }

  Map<String, bool> saveState() {
    return {
      'experienceC': experienceC.isExpanded,
      'educationC': educationC.isExpanded,
      'skillsC': skillsC.isExpanded,
      'coursesC': coursesC.isExpanded,
      'langC': langC.isExpanded,
      'hobbiesC': hobbiesC.isExpanded,
    };
  }

  void restoreState(Map<String, bool> state) async {
    await Future.delayed(const Duration(seconds: 1), () {
      if (scaffoldKey.currentContext != null &&
          scaffoldKey.currentContext!.mounted) {
        state['experienceC'] == true
            ? experienceC.expand()
            : experienceC.collapse();
        state['educationC'] == true
            ? educationC.expand()
            : educationC.collapse();
        state['skillsC'] == true ? skillsC.expand() : skillsC.collapse();
        state['coursesC'] == true ? coursesC.expand() : coursesC.collapse();
        state['langC'] == true ? langC.expand() : langC.collapse();
        state['hobbiesC'] == true ? hobbiesC.expand() : hobbiesC.collapse();
      }
    });
  }

  void collapseAll() {
    experienceC.collapse();
    educationC.collapse();
    skillsC.collapse();
    coursesC.collapse();
    langC.collapse();
    hobbiesC.collapse();
  }

  void expandAll() {
    experienceC.expand();
    educationC.expand();
    skillsC.expand();
    coursesC.expand();
    langC.expand();
    hobbiesC.expand();
  }
}
