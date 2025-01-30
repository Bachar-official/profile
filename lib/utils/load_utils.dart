import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

Future<ByteData> loadFont(String path) async {
  final ByteData data = await rootBundle.load(path);
  return data.buffer.asByteData();
}

Future<pw.MemoryImage> loadImage(String asset) async {
  return pw.MemoryImage(
    (await rootBundle.load(asset)).buffer.asUint8List(),
  );
}
