class Language {
  final String name;
  final String level;
  final String code;

  const Language({required this.name, required this.level, required this.code});

  factory Language.fromLocale(String locale) {
    final parts = locale.split(':');

    return Language(name: parts[0], code: parts[1], level: parts[2]);
  }
}
