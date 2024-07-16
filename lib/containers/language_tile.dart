import 'package:flutter/material.dart';
import 'package:profile/entity/language.dart';

class LanguageTile extends StatelessWidget {
  final String localeString;
  const LanguageTile({super.key, required this.localeString});

  @override
  Widget build(BuildContext context) {
    final Language language = Language.fromLocale(localeString);
    return ListTile(
      leading: getFlag(language.code),
      title: Text(language.name),
      subtitle: Text(language.level),
    );
  }
}

Widget getFlag(String code) {
  const size = 30.0;
  switch (code) {
    case 'en':
      return Image.asset(
        'assets/flags/GB.png',
        width: size,
        height: size,
      );
    case 'eo':
      return Image.asset(
        'assets/flags/EO.jpg',
        width: size,
        height: size,
      );
    case 'ru':
    default:
      return Image.asset(
        'assets/flags/RU.png',
        width: size,
        height: size,
      );
  }
}
