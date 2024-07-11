import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/app/di.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/containers/index.dart';
import './profile_holder.dart';
import './profile_state.dart';

final provider =
    StateNotifierProvider<ProfileHolder, ProfileState>((ref) => di.holder);

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(context, ref) {
    final state = ref.watch(provider);
    final manager = di.manager;
    final locale = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.author),
        actions: [
          LangButton(locale: state.locales, onChangeLocale: manager.setLocales),
          ThemeButton(theme: state.themes, onChangeTheme: manager.setThemes),
        ],
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(flex: 1, child: BioWidget()),
          Expanded(flex: 3, child: Text('AAAAAAAAAAAAAA')),
        ],
      ),
    );
  }
}
