import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpandButton extends StatelessWidget {
  final bool isCollapsed;
  final void Function() onExpandOrCollapse;
  const ExpandButton(
      {super.key, required this.isCollapsed, required this.onExpandOrCollapse});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Tooltip(
      message: isCollapsed ? localization.expandAll : localization.collapseAll,
      child: IconButton(
        onPressed: onExpandOrCollapse,
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isCollapsed
              ? const Icon(key: ValueKey('expand'), Icons.expand_more)
              : const Icon(key: ValueKey('collapse'), Icons.expand_less),
        ),
      ),
    );
  }
}
