import 'package:flutter/material.dart';
import 'package:profile/entity/experience.dart';
import 'package:profile/utils/parse_utils.dart';

class ExperienceTile extends StatelessWidget {
  final String localeString;
  final String localeCode;
  final String untilNow;
  const ExperienceTile({super.key, required this.localeString, required this.localeCode, required this.untilNow});

  @override
  Widget build(BuildContext context) {
    final Experience xp = Experience.fromLocalization(localeString);
    return Tooltip(
      message: xp.description,
      child: ListTile(
        title: Text(xp.companyName),
        subtitle: Text('${ParseUtils.parseDate(xp.from, localeCode, untilNow)} - ${ParseUtils.parseDate(xp.to, localeCode, untilNow)}'),
        trailing: Text(xp.position),
      ),
    );
  }
}