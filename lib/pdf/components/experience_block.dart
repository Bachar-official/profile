import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/entity/experience.dart';
import 'package:profile/utils/parse_utils.dart';

class ExperienceBlock extends pw.StatelessWidget {
  final AppLocalizations locale;

  ExperienceBlock({required this.locale});

  @override
  pw.Widget build(pw.Context context) {
    final List<Experience> xps = [locale.exp0, locale.exp1, locale.exp2]
        .map((e) => Experience.fromLocalization(e))
        .toList();
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: xps
          .map((xp) => Job(
                company: xp.companyName,
                description: xp.description,
                position: xp.position,
                from:
                    ParseUtils.parseDate(xp.from, locale.code, locale.untilNow),
                to: ParseUtils.parseDate(xp.to, locale.code, locale.untilNow),
              ))
          .toList(),
    );
  }
}

class Job extends pw.StatelessWidget {
  final String company;
  final String position;
  final String description;
  final String from;
  final String to;

  Job({
    required this.company,
    required this.description,
    required this.from,
    required this.position,
    required this.to,
  });

  @override
  pw.Widget build(pw.Context context) {
    const black = PdfColor.fromInt(0xFF000000);
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 6,
              height: 6,
              margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
              decoration: const pw.BoxDecoration(
                color: black,
                shape: pw.BoxShape.circle,
              ),
            ),
            pw.Flexible(
              child: pw.Text(
                company,
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(fontWeight: pw.FontWeight.bold),
              ),
            ),
          ],
        ),
        pw.Container(
          decoration: const pw.BoxDecoration(
            border: pw.Border(
              left: pw.BorderSide(color: black, width: 2),
            ),
          ),
          padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const pw.EdgeInsets.only(left: 5),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                position,
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(fontStyle: pw.FontStyle.italic),
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                description,
                style: const pw.TextStyle(
                  fontSize: 10,
                  lineSpacing: 1.5,
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Text('$from - $to'),
            ],
          ),
        ),
      ],
    );
  }
}
