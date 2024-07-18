// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void downloadAsset({required String asset, required String fileName}) {
  final anchor = html.AnchorElement(href: asset)
    ..target = 'blank'
    ..download = fileName;
  html.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
