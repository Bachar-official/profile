import 'package:flutter/material.dart';
import 'package:profile/constants/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeButton extends StatelessWidget {
  final Themes theme;
  final void Function(Themes) onChangeTheme;
  const ThemeButton(
      {super.key, required this.onChangeTheme, required this.theme});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: theme == Themes.light
            ? Tooltip(
                key: const ValueKey('light'),
                message: locale.darkTheme,
                child: const Icon(
                  Icons.dark_mode,
                ),
              )
            : Tooltip(
                key: const ValueKey('dark'),
                message: locale.lightTheme,
                child: const Icon(
                  Icons.light_mode,
                ),
              ),
      ),
      onPressed: () => onChangeTheme(theme.next),
    );
  }
}
