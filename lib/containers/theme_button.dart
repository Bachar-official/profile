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
        duration: const Duration(milliseconds: 500),
        child: theme == Themes.light
            ? Tooltip(
                message: locale.lightTheme,
                child: const Icon(
                  Icons.light_mode,
                  key: ValueKey('light'),
                ),
              )
            : Tooltip(
                message: locale.darkTheme,
                child: const Icon(
                  Icons.dark_mode,
                  key: ValueKey('dark'),
                ),
              ),
      ),
      onPressed: () => onChangeTheme(theme.next),
    );
  }
}
