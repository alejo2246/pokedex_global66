// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Pokédex';

  @override
  String get navPokedex => 'Pokédex';

  @override
  String get navRegions => 'Región';

  @override
  String get navFavorites => 'Favoritos';

  @override
  String get navProfile => 'Perfil';

  @override
  String get searchHint => 'Procurar Pokémon...';

  @override
  String get errorTitle => 'Algo salio mal...';

  @override
  String get retry => 'Reintentar';

  @override
  String get noPokemons => 'No hay Pokémons';

  @override
  String get noPokemonsWithFilters =>
      'Ningún Pokémon coincide con los filtros aplicados.';

  @override
  String get noPokemonsEmpty => 'La Pokédex está vacía por el momento.';

  @override
  String get clearFilters => 'Limpiar filtros';

  @override
  String resultsFound(int count) {
    return 'Se han encontrado $count resultados';
  }

  @override
  String get clearFilter => 'Borrar filtro';

  @override
  String get filterSheetTitle => 'Filtra por tus preferencias';

  @override
  String get filterTypeLabel => 'Tipo';

  @override
  String get apply => 'Aplicar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get weaknesses => 'Debilidades';

  @override
  String get noWeaknesses => 'Sin debilidades conocidas';

  @override
  String get weight => 'Peso';

  @override
  String get height => 'Altura';

  @override
  String get category => 'Categoría';

  @override
  String get ability => 'Habilidad';

  @override
  String get gender => 'Genero';

  @override
  String get genderless => 'Sin género';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get noFavorites => 'Sin favoritos';

  @override
  String get noFavoritesSubtitle =>
      'Agrega Pokémon a tus favoritos desde la Pokédex.';

  @override
  String get comingSoon => '¡Muy pronto disponible!';

  @override
  String get comingSoonSubtitle =>
      'Estamos trabajando para traerte esta sección. Vuelve más adelante para descubrir todas las novedades.';

  @override
  String get onboarding1Title => 'Todos los Pokémon en un solo lugar';

  @override
  String get onboarding1Description =>
      'Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo';

  @override
  String get onboarding1Button => 'Continuar';

  @override
  String get onboarding2Title => 'Mantén tu Pokédex actualizada';

  @override
  String get onboarding2Description =>
      'Regístrate y guarda tu perfil, Pokémon favoritos, configuraciones y mucho más en la aplicación';

  @override
  String get onboarding2Button => 'Empecemos';
}
