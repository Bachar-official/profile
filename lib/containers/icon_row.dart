import 'package:flutter/material.dart';

class IconRow extends StatelessWidget {
  final Widget icon;
  final String text;
  const IconRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(flex: 2, child: icon),
        Flexible(
          flex: 3,
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}