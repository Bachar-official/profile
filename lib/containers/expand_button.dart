import 'package:flutter/material.dart';

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
    return IconButton(
      onPressed: isCollapsed ? onExpand : onCollapse,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isCollapsed
            ? const Icon(key: ValueKey('expand'), Icons.expand_more)
            : const Icon(key: ValueKey('collapse'), Icons.expand_less),
      ),
    );
  }
}
