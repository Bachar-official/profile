import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpandButton extends StatelessWidget {
  final bool isCollapsed;
  final void Function() onExpand;
  final void Function() onCollapse;
  const ExpandButton(
      {super.key,
      required this.isCollapsed,
      required this.onCollapse,
      required this.onExpand});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Tooltip(
      message: isCollapsed ? localization.expandAll : localization.collapseAll,
      child: IconButton(
        onPressed: isCollapsed ? onExpand : onCollapse,
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
