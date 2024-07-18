import 'package:flutter/material.dart';
import 'package:profile/entity/experience.dart';
import 'package:profile/utils/parse_utils.dart';

class ExperienceStepper extends StatelessWidget {
  final List<String> localeStrings;
  final String localeCode;
  final String untilNow;
  const ExperienceStepper(
      {super.key,
      required this.localeCode,
      required this.localeStrings,
      required this.untilNow});

  @override
  Widget build(BuildContext context) {
    final List<Experience> xps =
        localeStrings.map((e) => Experience.fromLocalization(e)).toList();
    return Stepper(
      physics: const BouncingScrollPhysics(),
      stepIconMargin: EdgeInsets.zero,
      controlsBuilder: (_, __) => Container(),
      steps: xps
          .map(
            (xp) => Step(
              isActive: true,
              title: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(xp.companyName),
                subtitle: Text(
                    '${ParseUtils.parseDate(xp.from, localeCode, untilNow)} - ${ParseUtils.parseDate(xp.to, localeCode, untilNow)}'),
                trailing: Text(xp.position),
              ),
              subtitle: Text(xp.description),
              content: Container(),
            ),
          )
          .toList(),
    );
  }
}
