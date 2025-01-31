import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/app/di.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/constants/constants.dart';
import 'package:profile/containers/index.dart';
import 'package:profile/entity/course.dart';
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

    final bioWidget = BioWidget(
      author: locale.author,
      position: locale.position,
      onOpenEmail: manager.openEmail,
      onOpenGithub: manager.openGithub,
      onOpenTelegram: manager.openTelegram,
    );
    final experienceWidget = HideableWidget(
      key: manager.experienceK,
      title: locale.experience,
      trigger: manager.collectIsCollapsed,
      content: [
        ExperienceStepper(
            localeCode: locale.code,
            localeStrings: [locale.exp0, locale.exp1, locale.exp2],
            untilNow: locale.untilNow),
      ],
    );
    final educationWidget = HideableWidget(
      key: manager.educationK,
      title: locale.education,
      trigger: manager.collectIsCollapsed,
      content: [
        EducationStepper(
            localeCode: locale.code, localeStrings: [locale.ed0, locale.ed1]),
      ],
    );
    final skillsWidget = HideableWidget(
      trigger: manager.collectIsCollapsed,
      key: manager.skillsK,
      isRow: true,
      title: locale.hardSkills,
      content: hardSkills.map((skill) => Tag(text: skill)).toList(),
    );
    final courcesWidget = HideableWidget(
      trigger: manager.collectIsCollapsed,
      key: manager.coursesK,
      title: locale.cources,
      content: [locale.crs0, locale.crs1]
          .map((loc) => Course.fromLocale(loc))
          .map((course) => CourseTile(course: course, langCode: locale.code))
          .toList(),
    );
    final languagesWidget = HideableWidget(
      trigger: manager.collectIsCollapsed,
      key: manager.languagesK,
      title: locale.languages,
      content: [locale.lg0, locale.lg1, locale.lg2]
          .map((lg) => LanguageTile(localeString: lg))
          .toList(),
    );
    final hobbiesWidget = HideableWidget(
      trigger: manager.collectIsCollapsed,
      key: manager.hobbiesK,
      isRow: true,
      title: locale.hobbies,
      content: locale.allHobbies
          .split(',')
          .map(
            (hobby) => Tag(text: hobby, color: Colors.orange),
          )
          .toList(),
    );
    final projectsWidget = HideableWidget(
      trigger: manager.collectIsCollapsed,
      key: manager.projectsK,
      title: locale.projects,
      content: [locale.pr0, locale.pr1, locale.pr2, locale.pr3]
          .map(
            (project) => ProjectTile(localeString: project),
          )
          .toList(),
    );

    return state.isLoading
        ? Material(
          child: Center(
              child: Text(locale.pdfReady, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24),),
            ),
        )
        : Scaffold(
            appBar: AppBar(
              actions: [
                LangButton(
                    locale: state.locales, onChangeLocale: manager.setLocales),
                ThemeButton(
                    theme: state.themes, onChangeTheme: manager.setThemes),
                Tooltip(
                  message: locale.downloadContact,
                  child: IconButton(
                    onPressed: () async => await manager.downloadVCard(),
                    icon: const Icon(Icons.contact_mail),
                  ),
                ),
                Tooltip(
                  message: locale.downloadCv,
                  child: IconButton(
                    onPressed: () async => await manager.downloadCV(),
                    icon: const Icon(Icons.picture_as_pdf),
                  ),
                ),
                ExpandButton(
                  isFloatingActionButton: true,
                  key: const ValueKey('button'),
                  onExpandOrCollapse: manager.expandOrCollapseAll,
                  isCollapsed: state.isCollapsed,
                ),
                const SizedBox(width: 28),
              ],
            ),
            body: OrientationBuilder(
              builder: (context, orientation) {
                return orientation == Orientation.landscape
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: SingleChildScrollView(child: bioWidget),
                          ),
                          Expanded(
                            flex: 4,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  experienceWidget,
                                  educationWidget,
                                  skillsWidget,
                                  courcesWidget,
                                  projectsWidget,
                                  languagesWidget,
                                  hobbiesWidget,
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            bioWidget,
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                experienceWidget,
                                educationWidget,
                                skillsWidget,
                                courcesWidget,
                                projectsWidget,
                                languagesWidget,
                                hobbiesWidget,
                              ],
                            ),
                          ],
                        ),
                      );
              },
            ),
          );
  }
}
