import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/entity/index.dart';

class LanguagesBlock extends pw.StatelessWidget {
  final AppLocalizations locale;
  final Map<String, pw.MemoryImage> flags;

  LanguagesBlock({required this.locale, required this.flags});

  @override
  pw.Widget build(pw.Context context) {
    final langs = [locale.lg0, locale.lg1, locale.lg2]
        .map((lang) => Language.fromLocale(lang));

    return pw.Wrap(
      alignment: pw.WrapAlignment.spaceEvenly,
      runAlignment: pw.WrapAlignment.spaceEvenly,
      spacing: 8,
      runSpacing: 8,
      children: langs
          .map(
            (lang) => LanguageElement(
              language: lang,
              flag: pw.Image(flags[lang.code]!, width: 50, height: 25),
            ),
          )
          .toList(),
    );
  }
}

class LanguageElement extends pw.StatelessWidget {
  final Language language;
  final pw.Image flag;

  LanguageElement({required this.language, required this.flag});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
      mainAxisSize: pw.MainAxisSize.min,
      mainAxisAlignment: pw.MainAxisAlignment.start,
      children: [
        flag,
        pw.SizedBox(width: 10),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(language.name),
            pw.Text(
              language.level,
              style: const pw.TextStyle(fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}
