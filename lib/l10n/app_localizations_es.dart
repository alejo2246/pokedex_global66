// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Pokémon Favoritos';

  @override
  String get pokemonListTitle => 'Lista de Pokémon';

  @override
  String get favoritesTitle => 'Mis Favoritos';

  @override
  String get noFavoritesYet => 'Aún no hay favoritos.\n¡Empieza a agregar!';

  @override
  String pokemonType(String type) {
    return '$type';
  }

  @override
  String get statsLabel => 'Estadísticas';

  @override
  String get errorLoadingData =>
      'No se pudieron cargar los datos. Intenta de nuevo.';

  @override
  String get retry => 'Reintentar';
}
