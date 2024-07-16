import 'dart:math';

import 'package:flutter/material.dart';
import 'package:profile/constants/constants.dart';
import 'package:profile/constants/urls.dart';
import 'package:profile/profile_screen/profile_holder.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileManager {
  final ProfileHolder holder;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey;

  ProfileManager({required this.holder, required this.scaffoldKey});

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
}
