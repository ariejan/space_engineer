import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var t = Translations("en") +
    {
      "en": "Space Engineer",
      "nl": "Space Engineer 🇳🇱",
    } +
    {
      "en": "Mine %d asteroid"
        .zero("No asteroids to mine")
        .one("Mine asteroid")
        .many("Mine %d asteroids"),
      "nl": "1 Asteroide mijnen"
          .zero("Geen asteroides beschikbaar")
          .one("Asteroide ontginnen")
          .many("%d Asteroides ontginnen")
    };

  String get i18n => localize(this, t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(int value) => localizePlural(value, this, t);

  String version(Object modifier) => localizeVersion(modifier, this, t);

  Map<String, String> allVersions() => localizeAllVersions(this, t);
}
