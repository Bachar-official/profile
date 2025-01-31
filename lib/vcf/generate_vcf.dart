import 'dart:convert';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:profile/vcf/contact.dart';

void downloadVcf(BuildContext ctx) {
  final locale = AppLocalizations.of(ctx);
  final bytes = utf8.encode(locale.code == 'en' ? contactEn : contactRu);
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);

  html.AnchorElement(href: url)
    ..setAttribute('download', '${locale.author}.vcf')
    ..click();

  html.Url.revokeObjectUrl(url);
}
