import 'package:flutter/material.dart';
import 'package:profile/entity/education.dart';
import 'package:profile/utils/parse_utils.dart';

class EducationStepper extends StatelessWidget {
  final List<String> localeStrings;
  final String localeCode;
  const EducationStepper(
      {super.key, required this.localeCode, required this.localeStrings});

  @override
  Widget build(BuildContext context) {
    final List<Education> eds =
        localeStrings.map((e) => Education.fromLocale(e)).toList();
    return Stepper(
      physics: const BouncingScrollPhysics(),
      stepIconMargin: EdgeInsets.zero,
      controlsBuilder: (_, __) => Container(),
      steps: eds
          .map(
            (ed) => Step(
              isActive: true,
              title: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(ed.institutionName),
                subtitle: Text(
                    '${ParseUtils.parseGradeDate(ed.gradeDate, localeCode)} · ${ed.specialization}'),
              ),
              subtitle: Text(ed.qualification),
              content: Container(),
            ),
          )
          .toList(),
    );
  }
}
