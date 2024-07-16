import 'package:flutter/material.dart';
import 'package:profile/profile_screen/profile_holder.dart';
import 'package:profile/profile_screen/profile_manager.dart';

class DI {
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  late final ProfileHolder holder;
  late final ProfileManager manager;

  DI() {
    holder = ProfileHolder();
    manager = ProfileManager(holder: holder, scaffoldKey: scaffoldKey);
  }

  void init() {}
}

final di = DI();
