// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pokédex';

  @override
  String get navPokedex => 'Pokédex';

  @override
  String get navRegions => 'Regions';

  @override
  String get navFavorites => 'Favorites';

  @override
  String get navProfile => 'Profile';

  @override
  String get searchHint => 'Search Pokémon...';

  @override
  String get errorTitle => 'Something went wrong...';

  @override
  String get retry => 'Retry';

  @override
  String get noPokemons => 'No Pokémon found';

  @override
  String get noPokemonsWithFilters => 'No Pokémon matches the applied filters.';

  @override
  String get noPokemonsEmpty => 'The Pokédex is empty for now.';

  @override
  String get clearFilters => 'Clear filters';

  @override
  String resultsFound(int count) {
    return 'Found $count results';
  }

  @override
  String get clearFilter => 'Clear filter';

  @override
  String get filterSheetTitle => 'Filter by your preferences';

  @override
  String get filterTypeLabel => 'Type';

  @override
  String get apply => 'Apply';

  @override
  String get cancel => 'Cancel';

  @override
  String get weaknesses => 'Weaknesses';

  @override
  String get noWeaknesses => 'No known weaknesses';

  @override
  String get weight => 'Weight';

  @override
  String get height => 'Height';

  @override
  String get category => 'Category';

  @override
  String get ability => 'Ability';

  @override
  String get gender => 'Gender';

  @override
  String get genderless => 'No gender';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get noFavorites => 'No favorites';

  @override
  String get noFavoritesSubtitle =>
      'Add Pokémon to your favorites from the Pokédex.';

  @override
  String get comingSoon => 'Coming soon!';

  @override
  String get comingSoonSubtitle =>
      'We are working to bring you this section. Come back later to discover all the news.';

  @override
  String get onboarding1Title => 'All Pokémon in one place';

  @override
  String get onboarding1Description =>
      'Access a wide list of Pokémon from all generations created by Nintendo';

  @override
  String get onboarding1Button => 'Continue';

  @override
  String get onboarding2Title => 'Keep your Pokédex up to date';

  @override
  String get onboarding2Description =>
      'Sign up and save your profile, favorite Pokémon, settings and much more in the app';

  @override
  String get onboarding2Button => 'Let\'s go';
}
