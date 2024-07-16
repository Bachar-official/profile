import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/app/di.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/constants/constants.dart';
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
    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;

    const bioWidget = BioWidget();
    const positionWidget = Position();
    final experienceWidget = HideableWidget(
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
    );
    final educationWidget = HideableWidget(
      title: locale.education,
      content: [
        EducationTile(localeCode: locale.code, localeString: locale.ed0),
        EducationTile(localeCode: locale.code, localeString: locale.ed1),
      ],
    );
    final skillsWidget = HideableWidget(
      isRow: true,
      title: locale.hardSkills,
      content: hardSkills.map((skill) => SkillTag(skill: skill)).toList(),
    );
    final courcesWidget = HideableWidget(title: locale.cources, content: []);
    final languagesWidget =
        HideableWidget(title: locale.languages, content: []);
    final hobbiesWidget = HideableWidget(title: locale.hobbies, content: []);

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.author),
        actions: [
          LangButton(locale: state.locales, onChangeLocale: manager.setLocales),
          ThemeButton(theme: state.themes, onChangeTheme: manager.setThemes),
        ],
      ),
      body: isPortrait
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  bioWidget,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      positionWidget,
                      experienceWidget,
                      educationWidget,
                      skillsWidget,
                      courcesWidget,
                      languagesWidget,
                      hobbiesWidget,
                    ],
                  ),
                ],
              ),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 1,
                  child: bioWidget,
                ),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        positionWidget,
                        experienceWidget,
                        educationWidget,
                        skillsWidget,
                        courcesWidget,
                        languagesWidget,
                        hobbiesWidget,
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
