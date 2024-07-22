import 'package:profile/constants/constants.dart';

class Urls {
  static Uri githubUri = Uri.parse('https://github.com/Bachar-official');
  static Uri telegramUri = Uri.parse('https://t.me/Bachar_official');
  static Uri emailUri = Uri.parse('mailto://cjba4ar@gmail.com');
  static const baseAssetUrl =
      'https://bachar-official.github.io/profile/assets/assets';
  static Uri downloadVcardUri =
      Uri.parse('$baseAssetUrl/downloads/contact.vcf');
  static Uri downloadCVUri(Themes theme, Locales locale) {
    return Uri.parse(
        '$baseAssetUrl/downloads/cv_${theme.name}_${locale.name}.pdf');
  }
}
