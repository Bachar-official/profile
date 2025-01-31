import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/entity/index.dart';

class ProjectsBlock extends pw.StatelessWidget {
  final AppLocalizations locale;

  ProjectsBlock({required this.locale});

  @override
  pw.Widget build(pw.Context context) {
    final projects = [locale.pr0, locale.pr1, locale.pr2, locale.pr3]
        .map((e) => Project.fromLocale(e))
        .toList();
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: projects
          .map((proj) => ProjectElement(locale: locale, project: proj))
          .toList(),
    );
  }
}

class ProjectElement extends pw.StatelessWidget {
  final AppLocalizations locale;
  final Project project;

  ProjectElement({required this.locale, required this.project});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          project.name,
          style: pw.Theme.of(context)
              .defaultTextStyle
              .copyWith(fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          project.description,
          style: const pw.TextStyle(
            fontSize: 10,
            lineSpacing: 1.5,
          ),
        ),
        pw.UrlLink(child: pw.Text(project.url), destination: project.url),
      ],
    );
  }
}
