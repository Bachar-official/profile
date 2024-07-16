import 'package:flutter/material.dart';
import 'package:profile/entity/education.dart';
import 'package:profile/utils/parse_utils.dart';

class EducationTile extends StatelessWidget {
  final String localeString;
  final String localeCode;
  const EducationTile({super.key, required this.localeCode, required this.localeString});

  @override
  Widget build(BuildContext context) {
    final Education ed = Education.fromLocale(localeString);
    return ListTile(
      title: Text(ed.institutionName),
      subtitle: Text('${ParseUtils.parseGradeDate(ed.gradeDate, localeCode)} · ${ed.specialization}'),
      trailing: Text(ed.qualification),
    );
  }
}