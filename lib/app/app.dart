import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/app/di.dart';
import 'package:profile/profile_screen/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/profile_screen/profile_screen.dart';

final provider =
    StateNotifierProvider<ProfileHolder, ProfileState>((ref) => di.holder);

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(context, ref) {
    final state = ref.watch(provider);
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: MaterialApp(
        key: ValueKey(
            state.locales.locale.hashCode + state.themes.theme.hashCode),
        debugShowCheckedModeBanner: false,
        title: 'Ivan Bacharnikov',
        home: const ProfileScreen(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: state.themes.theme,
        locale: state.locales.locale,
      ),
    );
  }
}
