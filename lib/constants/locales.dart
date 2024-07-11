import 'package:flutter/material.dart';

enum Locales {
  ru,
  en;

  Locale get locale =>
      this == Locales.ru ? const Locale('ru') : const Locale('en');

  Locales get next => this == Locales.ru ? Locales.en : Locales.ru;
}
