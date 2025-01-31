import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/pdf/components/colored_tag.dart';

class HobbiesBlock extends pw.StatelessWidget {
  final AppLocalizations locale;

  HobbiesBlock({required this.locale});

  @override
  pw.Widget build(pw.Context context) {
    final hobbies = locale.allHobbies.split(',');

    return pw.Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: hobbies
          .map(
            (hobby) => ColoredTag(
              text: hobby,
              color: const PdfColor.fromInt(0xFFFF98000),
            ),
          )
          .toList(),
    );
  }
}
