import 'package:flutter/material.dart';
import 'package:profile/constants/constants.dart';
import 'package:profile/constants/urls.dart';
import 'package:profile/containers/hideable_widget.dart';
import 'package:profile/pdf/generate_resume.dart';
import 'package:profile/profile_screen/profile_holder.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileManager {
  final ProfileHolder holder;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey;

  ProfileManager({required this.holder, required this.scaffoldKey});

  final GlobalKey<HideableWidgetState> experienceK =
      GlobalKey<HideableWidgetState>();
  final GlobalKey<HideableWidgetState> educationK =
      GlobalKey<HideableWidgetState>();
  final GlobalKey<HideableWidgetState> skillsK =
      GlobalKey<HideableWidgetState>();
  final GlobalKey<HideableWidgetState> coursesK =
      GlobalKey<HideableWidgetState>();
  final GlobalKey<HideableWidgetState> languagesK =
      GlobalKey<HideableWidgetState>();
  final GlobalKey<HideableWidgetState> hobbiesK =
      GlobalKey<HideableWidgetState>();
  final GlobalKey<HideableWidgetState> projectsK =
      GlobalKey<HideableWidgetState>();

  void setThemes(Themes theme) {
    holder.setThemes(theme);
  }

  void setLocales(Locales locale) {
    holder.setLocales(locale);
  }

  Future<void> openGithub() async {
    await launchUrl(Urls.githubUri);
  }

  Future<void> openTelegram() async {
    await launchUrl(Urls.telegramUri);
  }

  Future<void> openEmail() async {
    await launchUrl(Urls.emailUri);
  }

  Future<void> downloadVCard() async {
    await launchUrl(Urls.downloadVcardUri);
  }

  Future<void> downloadCV() async {
    await downloadResume(scaffoldKey);
    // await launchUrl(
    //     Urls.downloadCVUri(holder.oState.themes, holder.oState.locales));
  }

  void collectIsCollapsed() {
    if (experienceK.currentState != null &&
        educationK.currentState != null &&
        skillsK.currentState != null &&
        coursesK.currentState != null &&
        languagesK.currentState != null &&
        hobbiesK.currentState != null &&
        projectsK.currentState != null) {
      holder.setIsCollapsed(experienceK.currentState!.isCollapsed &&
          educationK.currentState!.isCollapsed &&
          skillsK.currentState!.isCollapsed &&
          coursesK.currentState!.isCollapsed &&
          languagesK.currentState!.isCollapsed &&
          hobbiesK.currentState!.isCollapsed &&
          projectsK.currentState!.isCollapsed);
    } else {
      holder.setIsCollapsed(true);
    }
  }

  void expandOrCollapseAll() {
    if (holder.oState.isCollapsed) {
      experienceK.currentState!.expand();
      educationK.currentState!.expand();
      skillsK.currentState!.expand();
      coursesK.currentState!.expand();
      languagesK.currentState!.expand();
      hobbiesK.currentState!.expand();
      projectsK.currentState!.expand();
      holder.setIsCollapsed(false);
    } else {
      experienceK.currentState!.collapse();
      educationK.currentState!.collapse();
      skillsK.currentState!.collapse();
      coursesK.currentState!.collapse();
      languagesK.currentState!.collapse();
      hobbiesK.currentState!.collapse();
      projectsK.currentState!.collapse();
      holder.setIsCollapsed(true);
    }
  }
}
