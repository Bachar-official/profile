import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Bio extends pw.StatelessWidget {
  final AppLocalizations locale;
  final pw.MemoryImage avatar;
  final pw.Font symbolFont;

  Bio({required this.locale, required this.avatar, required this.symbolFont});

  @override
  pw.Widget build(pw.Context context) {
    return pw.DecoratedBox(
      decoration: const pw.BoxDecoration(
        boxShadow: [
          pw.BoxShadow(
            color: PdfColors.black,
            blurRadius: 8.0,
            spreadRadius: 0.0,
            offset: PdfPoint(0.0, 2.0),
          )
        ],
      ),
      child: pw.Column(
        children: [
          pw.Image(avatar, width: 100, height: 100),
          pw.FittedBox(
            fit: pw.BoxFit.scaleDown,
            child: pw.Text(
              locale.author,
              style: pw.Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.FittedBox(
            fit: pw.BoxFit.scaleDown,
            child: pw.Text(locale.position),
          ),
          pw.SizedBox(height: 5),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
            children: [
              pw.UrlLink(
                  child: pw.Text(
                    'T',
                    style: pw.TextStyle(font: symbolFont, fontSize: 15),
                  ),
                  destination: locale.tgLink),
              pw.UrlLink(
                  child: pw.Text(
                    'E',
                    style: pw.TextStyle(font: symbolFont, fontSize: 15),
                  ),
                  destination: locale.emailLink),
              pw.UrlLink(
                  child: pw.Text(
                    'G',
                    style: pw.TextStyle(font: symbolFont, fontSize: 15),
                  ),
                  destination: locale.githubLink),
            ],
          ),
        ],
      ),
    );
  }
}
