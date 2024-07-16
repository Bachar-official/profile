import 'package:flutter/material.dart';
import 'package:profile/entity/course.dart';
import 'package:profile/utils/parse_utils.dart';

class CourseTile extends StatelessWidget {
  final String langCode;
  final Course course;
  const CourseTile({super.key, required this.course, required this.langCode});

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(course.name),
        subtitle: Text(course.company),
        trailing: Text(
          ParseUtils.parseGradeDate(course.endedAt, langCode),
        ),
      );
}
