import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// App title
  ///
  /// In en, this message translates to:
  /// **'Pokédex'**
  String get appTitle;

  /// No description provided for @navPokedex.
  ///
  /// In en, this message translates to:
  /// **'Pokédex'**
  String get navPokedex;

  /// No description provided for @navRegions.
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get navRegions;

  /// No description provided for @navFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get navFavorites;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search Pokémon...'**
  String get searchHint;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong...'**
  String get errorTitle;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noPokemons.
  ///
  /// In en, this message translates to:
  /// **'No Pokémon found'**
  String get noPokemons;

  /// No description provided for @noPokemonsWithFilters.
  ///
  /// In en, this message translates to:
  /// **'No Pokémon matches the applied filters.'**
  String get noPokemonsWithFilters;

  /// No description provided for @noPokemonsEmpty.
  ///
  /// In en, this message translates to:
  /// **'The Pokédex is empty for now.'**
  String get noPokemonsEmpty;

  /// No description provided for @clearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get clearFilters;

  /// No description provided for @resultsFound.
  ///
  /// In en, this message translates to:
  /// **'Found {count} results'**
  String resultsFound(int count);

  /// No description provided for @clearFilter.
  ///
  /// In en, this message translates to:
  /// **'Clear filter'**
  String get clearFilter;

  /// No description provided for @filterSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter by your preferences'**
  String get filterSheetTitle;

  /// No description provided for @filterTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get filterTypeLabel;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Weaknesses'**
  String get weaknesses;

  /// No description provided for @noWeaknesses.
  ///
  /// In en, this message translates to:
  /// **'No known weaknesses'**
  String get noWeaknesses;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @ability.
  ///
  /// In en, this message translates to:
  /// **'Ability'**
  String get ability;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @genderless.
  ///
  /// In en, this message translates to:
  /// **'No gender'**
  String get genderless;

  /// No description provided for @favoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesTitle;

  /// No description provided for @noFavorites.
  ///
  /// In en, this message translates to:
  /// **'No favorites'**
  String get noFavorites;

  /// No description provided for @noFavoritesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add Pokémon to your favorites from the Pokédex.'**
  String get noFavoritesSubtitle;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon!'**
  String get comingSoon;

  /// No description provided for @comingSoonSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We are working to bring you this section. Come back later to discover all the news.'**
  String get comingSoonSubtitle;

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'All Pokémon in one place'**
  String get onboarding1Title;

  /// No description provided for @onboarding1Description.
  ///
  /// In en, this message translates to:
  /// **'Access a wide list of Pokémon from all generations created by Nintendo'**
  String get onboarding1Description;

  /// No description provided for @onboarding1Button.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboarding1Button;

  /// No description provided for @onboarding2Title.
  ///
  /// In en, this message translates to:
  /// **'Keep your Pokédex up to date'**
  String get onboarding2Title;

  /// No description provided for @onboarding2Description.
  ///
  /// In en, this message translates to:
  /// **'Sign up and save your profile, favorite Pokémon, settings and much more in the app'**
  String get onboarding2Description;

  /// No description provided for @onboarding2Button.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go'**
  String get onboarding2Button;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
