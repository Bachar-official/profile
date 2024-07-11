import 'package:flutter/material.dart';
import 'package:profile/constants/locales.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LangButton extends StatelessWidget {
  final Locales locale;
  final void Function(Locales) onChangeLocale;
  const LangButton(
      {super.key, required this.locale, required this.onChangeLocale});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    var isEn = locale == Locales.en;
    const size = 15.0;
    return IconButton(
      onPressed: () => onChangeLocale(locale.next),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: isEn
            ? Tooltip(
                message: localization.anotherLanguage,
                child: CircleAvatar(
                  maxRadius: size,
                  backgroundImage: Image.asset(
                    'assets/flags/RU.png',
                    width: size,
                    height: size,
                  ).image,
                  key: const ValueKey('ru'),
                ),
              )
            : Tooltip(
                message: localization.anotherLanguage,
                child: CircleAvatar(
                  maxRadius: size,
                  backgroundImage: Image.asset(
                    'assets/flags/GB.png',
                    width: size,
                    height: size,
                  ).image,
                  key: const ValueKey('gb'),
                ),
              ),
      ),
    );
  }
}
