// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pokémon Favorites';

  @override
  String get pokemonListTitle => 'Pokémon List';

  @override
  String get favoritesTitle => 'My Favorites';

  @override
  String get noFavoritesYet => 'No favorites yet.\nStart adding some!';

  @override
  String pokemonType(String type) {
    return '$type';
  }

  @override
  String get statsLabel => 'Stats';

  @override
  String get errorLoadingData => 'Could not load data. Please try again.';

  @override
  String get retry => 'Retry';
}
