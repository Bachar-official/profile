import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/app/di.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/constants/constants.dart';
import 'package:profile/containers/experience_tile.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 1,
            child: BioWidget(),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Position(),
                  HideableWidget(
                    title: locale.experience,
                    content: [
                      ExperienceTile(
                        localeCode: locale.code,
                        localeString: locale.exp0,
                        untilNow: locale.untilNow,
                      ),
                      ExperienceTile(
                        localeCode: locale.code,
                        localeString: locale.exp1,
                        untilNow: locale.untilNow,
                      ),
                    ],
                  ),
                  HideableWidget(
                    isRow: true,
                    title: locale.hardSkills,
                    content: hardSkills
                        .map((skill) => SkillTag(skill: skill))
                        .toList(),
                  ),
                  HideableWidget(title: locale.education, content: []),
                  HideableWidget(title: locale.cources, content: []),
                  HideableWidget(title: locale.languages, content: []),
                  HideableWidget(title: locale.hobbies, content: []),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
