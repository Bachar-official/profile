import 'package:flutter/material.dart';

class HideableWidget extends StatefulWidget {
  final ExpansionTileController? controller;
  final String title;
  final bool? isRow;
  final List<Widget> content;
  final void Function() trigger;
  const HideableWidget(
      {super.key,
      required this.content,
      required this.title,
      required this.trigger,
      this.isRow,
      this.controller});

  @override
  State<HideableWidget> createState() => HideableWidgetState();
}

class HideableWidgetState extends State<HideableWidget> {
  final ExpansionTileController controller = ExpansionTileController();
  bool isCollapsed = true;

  void expand() {
    controller.expand();
    isCollapsed = false;
    setState(() {});
  }

  void collapse() {
    controller.collapse();
    isCollapsed = true;
    setState(() {});
  }

  void _onExpansionChanged(bool isExpanded) {
    isCollapsed = !isExpanded;
    widget.trigger();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isRowEnabled = widget.isRow != null && widget.isRow!;

    return Card(
      child: ExpansionTile(
          controller: controller,
          onExpansionChanged: _onExpansionChanged,
          maintainState: true,
          childrenPadding: const EdgeInsets.all(10.0),
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          children: isRowEnabled
              ? [
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: widget.content,
                  ),
                ]
              : widget.content),
    );
  }
}
