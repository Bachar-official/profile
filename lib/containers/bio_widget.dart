import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BioWidget extends StatelessWidget {
  final String author;
  final String position;
  final Future<void> Function() onOpenGithub;
  final Future<void> Function() onOpenTelegram;
  final Future<void> Function() onOpenEmail;
  const BioWidget(
      {super.key,
      required this.author,
      required this.position,
      required this.onOpenGithub,
      required this.onOpenTelegram,
      required this.onOpenEmail});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final filter = ColorFilter.mode(
        brightness == Brightness.dark ? Colors.white : Colors.black,
        BlendMode.srcIn);
    const size = 25.0;
    const padding = EdgeInsets.symmetric(horizontal: 10.0);

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FractionallySizedBox(
            child: Image.asset(
              'assets/photos/avatar.png',
              fit: BoxFit.fitWidth,
              width: 400,
            ),
          ),
          Padding(
            padding: padding,
            child: FractionallySizedBox(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  author,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: size),
                ),
              ),
            ),
          ),
          Padding(
            padding: padding,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                position,
                style: const TextStyle(fontSize: size),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: onOpenTelegram,
                icon: SvgPicture.asset(
                  'services/telegram.svg',
                  width: size,
                  height: size,
                  colorFilter: filter,
                ),
              ),
              IconButton(
                onPressed: onOpenEmail,
                icon: SvgPicture.asset(
                  'services/email.svg',
                  width: size,
                  height: size,
                  colorFilter: filter,
                ),
              ),
              IconButton(
                onPressed: onOpenGithub,
                icon: SvgPicture.asset(
                  'services/github.svg',
                  width: size,
                  height: size,
                  colorFilter: filter,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
