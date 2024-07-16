import 'package:flutter/material.dart';

class HideableWidget extends StatelessWidget {
  final ExpansionTileController controller;
  final String title;
  final bool? isRow;
  final void Function(bool)? onExpansionChanged;
  final List<Widget> content;
  const HideableWidget(
      {super.key,
      required this.content,
      required this.title,
      this.onExpansionChanged,
      this.isRow,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    final isRowEnabled = isRow != null && isRow!;

    return Card(
      key: UniqueKey(),
      child: ExpansionTile(
          onExpansionChanged: onExpansionChanged,
          controller: controller,
          maintainState: true,
          childrenPadding: const EdgeInsets.all(10.0),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          children: isRowEnabled
              ? [
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: content,
                  ),
                ]
              : content),
    );
  }
}
