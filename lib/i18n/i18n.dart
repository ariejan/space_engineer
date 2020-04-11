import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sprintf/sprintf.dart';

class I18n {

  // Currently used locale
  final Locale locale;

  I18n(this.locale);

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app.title': 'Space Engineer 🇬🇧',
      'home.btn_mine.zero': 'Nothing to mine...',
      'home.btn_mine.one': 'Mine one asteroid',
      'home.btn_mine.many': 'Mine %d asteroids',
    },
    'nl': {
      'app.title': 'Space Engineer 🇳🇱',
      'home.btn_mine.zero': 'Geen asteroides...',
      'home.btn_mine.one': 'Eén asteroide afgraven',
      'home.btn_mine.many': '%d asteroides afgraven',
    }
  };

  // Translates a key to a localized value
  //   I18n.of(context).t('app.title') => "My App"
  String t(String key) {
    return _localizedValues[locale.languageCode][key];
  }

  // Translates a key with a pluralized translation.
  //   I18n.of(context).t('app.nr_of_users', 0) => "No User"
  //   I18n.of(context).t('app.nr_of_users', 1) => "1 User"
  //   I18n.of(context).t('app.nr_of_users', 42) => "42 Users"
  String pluralize(String key, int number) {
    switch(number) {
      case 0: {
        return t(key + ".zero");
      }
      break;

      case 1: {
        return t(key + ".one");
      }
      break;

      default: {
        return sprintf(t(key + ".many"), [number]);
      }
      break;
    }
  }

  static const LocalizationsDelegate<I18n> delegate = _I18nDelegate();
}

class _I18nDelegate extends LocalizationsDelegate<I18n> {
  const _I18nDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'nl'].contains(locale.languageCode);

  @override
  Future<I18n> load(Locale locale) {
    return SynchronousFuture<I18n>(I18n(locale));
  }

  @override
  bool shouldReload(_I18nDelegate old) => false;
}