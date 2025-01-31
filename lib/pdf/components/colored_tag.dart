import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ColoredTag extends pw.StatelessWidget {
  final String text;
  final PdfColor color;
  final PdfColor textColor;

  ColoredTag({
    required this.text,
    required this.color,
    this.textColor = PdfColors.white,
  });

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: pw.BoxDecoration(
        color: color,
        borderRadius: pw.BorderRadius.circular(4),
      ),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          color: textColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
