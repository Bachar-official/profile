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
        duration: const Duration(seconds: 1),
        child: isEn
            ? Tooltip(
                key: const ValueKey('ru'),
                message: localization.anotherLanguage,
                child: CircleAvatar(
                  minRadius: size,
                  maxRadius: size,
                  backgroundImage: Image.asset(
                    'assets/flags/RU.png',
                    width: size,
                    height: size,
                  ).image,
                ),
              )
            : Tooltip(
                key: const ValueKey('gb'),
                message: localization.anotherLanguage,
                child: CircleAvatar(
                  minRadius: size,
                  maxRadius: size,
                  backgroundImage: Image.asset(
                    'assets/flags/GB.png',
                    width: size,
                    height: size,
                  ).image,
                ),
              ),
      ),
    );
  }
}
