import 'package:profile/profile_screen/profile_holder.dart';
import 'package:profile/profile_screen/profile_manager.dart';

class DI {
  late final ProfileHolder holder;
  late final ProfileManager manager;

  DI() {
    holder = ProfileHolder();
    manager = ProfileManager(holder: holder);
  }

  void init() {}
}

final di = DI();
