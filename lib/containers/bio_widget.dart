import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BioWidget extends StatelessWidget {
  const BioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context);
    final brightness = Theme.of(context).brightness;
    final filter = ColorFilter.mode(
        brightness == Brightness.dark ? Colors.white : Colors.black,
        BlendMode.srcIn);
    const size = 30.0;

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
          FractionallySizedBox(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(localize.author, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: size),),
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(localize.position, style: const TextStyle(fontStyle: FontStyle.italic, fontSize: size),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'services/telegram.svg',
                  width: size,
                  height: size,
                  colorFilter: filter,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'services/email.svg',
                  width: size,
                  height: size,
                  colorFilter: filter,
                ),
              ),
              IconButton(
                onPressed: () {},
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
