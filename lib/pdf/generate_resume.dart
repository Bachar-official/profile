import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:html' as html;

import 'package:profile/pdf/components/bio.dart';
import 'package:profile/pdf/components/info.dart';
import 'package:profile/pdf/components/projects_block.dart';
import 'package:profile/utils/load_utils.dart';

Future<Uint8List> generateResume(BuildContext context) async {
  final locale = AppLocalizations.of(context);
  final doc = pw.Document(title: 'CV', author: 'Ivan Bacharnikov');
  final regularFont = await loadFont('assets/fonts/OpenSans-Regular.ttf');
  final boldFont = await loadFont('assets/fonts/OpenSans-Bold.ttf');
  final italicFont = await loadFont('assets/fonts/OpenSans-Italic.ttf');
  final symbolFont = await loadFont('assets/fonts/symbol.ttf');

  final avatar = await loadImage('assets/photos/avatar.png');

  doc
    ..addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(
          margin: const pw.EdgeInsets.all(20),
          theme: pw.ThemeData.withFont(
            base: pw.Font.ttf(regularFont),
            bold: pw.Font.ttf(boldFont),
            italic: pw.Font.ttf(italicFont),
          ),
        ),
        build: (ctx) => [
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Flexible(
                flex: 1,
                child: Bio(
                  locale: locale,
                  avatar: avatar,
                  symbolFont: pw.Font.ttf(symbolFont),
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Flexible(
                flex: 4,
                child: Info(locale: locale),
              ),
            ],
          ),
        ],
      ),
    )
    ..addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(
          margin: const pw.EdgeInsets.all(20),
          theme: pw.ThemeData.withFont(
            base: pw.Font.ttf(regularFont),
            bold: pw.Font.ttf(boldFont),
            italic: pw.Font.ttf(italicFont),
          ),
        ),
        build: (ctx) => [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(
                level: 0,
                title: locale.projects,
                child: pw.Text(locale.projects),
              ),
              ProjectsBlock(locale: locale),
            ],
          ),
        ],
      ),
    );

  return doc.save();
}

Future<void> downloadResume(
    GlobalKey<ScaffoldMessengerState> scaffoldKey) async {
  if (kIsWeb) {
    final pdf = await compute(generateResume, scaffoldKey.currentContext!);
    List<int> arr = List.from(pdf);
    html.AnchorElement()
      ..href =
          "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(arr)}"
      ..setAttribute("download", "${DateTime.now().millisecondsSinceEpoch}.pdf")
      ..click();
  }
}
