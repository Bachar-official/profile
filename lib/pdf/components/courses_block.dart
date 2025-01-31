import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/entity/index.dart';
import 'package:profile/utils/parse_utils.dart';

class CoursesBlock extends pw.StatelessWidget {
  final AppLocalizations locale;

  CoursesBlock({required this.locale});

  @override
  pw.Widget build(pw.Context context) {
    List<Course> courses =
        [locale.crs0, locale.crs1].map((e) => Course.fromLocale(e)).toList();

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: courses
          .map((course) => CourseElement(course: course, locale: locale))
          .toList(),
    );
  }
}

class CourseElement extends pw.StatelessWidget {
  final Course course;
  final AppLocalizations locale;

  CourseElement({required this.course, required this.locale});

  @override
  pw.Widget build(pw.Context context) {
    const black = PdfColor.fromInt(0xFF000000);
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 6,
              height: 6,
              margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
              decoration: const pw.BoxDecoration(
                color: black,
                shape: pw.BoxShape.circle,
              ),
            ),
            pw.Flexible(
              child: pw.Text(
                course.name,
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(fontWeight: pw.FontWeight.bold),
              ),
            ),
          ],
        ),
        pw.Container(
          decoration: const pw.BoxDecoration(
            border: pw.Border(
              left: pw.BorderSide(color: black, width: 2),
            ),
          ),
          padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const pw.EdgeInsets.only(left: 5),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                course.company,
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(fontStyle: pw.FontStyle.italic),
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                ParseUtils.parseDate(
                    course.endedAt, locale.code, locale.untilNow),
                style: const pw.TextStyle(
                  fontSize: 10,
                  lineSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
