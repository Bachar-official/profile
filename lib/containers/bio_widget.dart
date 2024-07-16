import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile/constants/bio_info.dart';
import 'package:profile/containers/icon_row.dart';
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
        children: [
          Image.asset(
            'assets/photos/avatar.png',
            fit: BoxFit.fitWidth,
          ),
          IconRow(
            icon: SvgPicture.asset(
              '/services/location.svg',
              width: size,
              height: size,
              colorFilter: filter,
            ),
            text: localize.currentCity,
          ),
          IconRow(
              icon: SvgPicture.asset(
                'services/telegram.svg',
                width: size,
                height: size,
                colorFilter: filter,
              ),
              text: BioInfo.telegram),
          IconRow(
              icon: SvgPicture.asset(
                'services/email.svg',
                width: size,
                height: size,
                colorFilter: filter,
              ),
              text: BioInfo.email),
          IconRow(
              icon: SvgPicture.asset(
                'services/github.svg',
                width: size,
                height: size,
                colorFilter: filter,
              ),
              text: BioInfo.github),
        ],
      ),
    );
  }
}
