import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sprintf/sprintf.dart';

class I18n {

  final Locale locale;

  Map<String, String> _localizedValues;

  I18n(this.locale);

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  Map<String, String> parseJson(Map<String, dynamic> data, List<String> baseKey) {
    var entries = Map<String, String>();

    data.keys.forEach((key) {
      List<String> thisKey = List.of(baseKey);
      thisKey.add(key);

      dynamic value = data[key];

      if (value.runtimeType == String) {
        entries.putIfAbsent(thisKey.join("."), () => value.toString());
      } else {
        entries.addAll(parseJson(value, thisKey));
      }
    });

    return entries;
  }

  Future<bool> load() async {
    String jsonString =
      await rootBundle.loadString('i18n/${locale.languageCode}.json');

    Map<String, dynamic> jsonData = json.decode(jsonString);

    _localizedValues = parseJson(jsonData, List<String>());
    
    return true;
  }

  // Translates a key to a localized value
  //   I18n.of(context).t('app.title') => "My App"
  String t(String key) {
    if (_localizedValues.containsKey(key)) {
      return _localizedValues[key];
    }

    print("Undefined i18n key: " + key);

    return key;
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
  Future<I18n> load(Locale locale) async {
    I18n localizations = new I18n(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_I18nDelegate old) => false;
}