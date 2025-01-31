import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:profile/constants/constants.dart';
import 'package:profile/pdf/components/colored_tag.dart';

class HardSkillsBlock extends pw.StatelessWidget {

  HardSkillsBlock();

  @override
  pw.Widget build(pw.Context context) {
    return pw.Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: hardSkills
          .map(
            (skill) => ColoredTag(
              text: skill,
              color: const PdfColor.fromInt(0xFF4CAF50),
            ),
          )
          .toList(),
    );
  }
}
