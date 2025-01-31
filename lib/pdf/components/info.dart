import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/pdf/components/courses_block.dart';
import 'package:profile/pdf/components/education_block.dart';
import 'package:profile/pdf/components/experience_block.dart';
import 'package:profile/pdf/components/hard_skills_block.dart';
import 'package:profile/pdf/components/projects_block.dart';

class Info extends pw.StatelessWidget {
  final AppLocalizations locale;

  Info({required this.locale});

  @override
  pw.Widget build(pw.Context context) {
    final divider = pw.SizedBox(height: 10);
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Header(
          level: 0,
          title: locale.experience,
          child: pw.Text(locale.experience),
        ),
        ExperienceBlock(locale: locale),
        divider,
        pw.Header(
          level: 0,
          title: locale.education,
          child: pw.Text(locale.education),
        ),
        EducationBlock(locale: locale),
        divider,
        pw.Header(
          level: 0,
          title: locale.hardSkills,
          child: pw.Text(locale.hardSkills),
        ),
        HardSkillsBlock(),
        divider,
        pw.Header(
          level: 0,
          title: locale.cources,
          child: pw.Text(locale.cources),
        ),
        CoursesBlock(locale: locale),
      ],
    );
  }
}
