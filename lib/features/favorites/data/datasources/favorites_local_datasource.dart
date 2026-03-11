import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/data/local/shared_preferences/shared_preferences_provider.dart';
import '../../../pokedex/domain/entities/pokemon.dart';

part 'favorites_local_datasource.g.dart';

abstract interface class FavoritesLocalDataSource {
  List<Pokemon> getAll();
  void save(Pokemon pokemon);
  void remove(int id);
  bool isFavorite(int id);
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final SharedPreferences _prefs;
  static const _key = 'favorites';

  FavoritesLocalDataSourceImpl(this._prefs);

  @override
  List<Pokemon> getAll() {
    final raw = _prefs.getStringList(_key) ?? [];
    return raw
        .map((e) => Pokemon.fromJson(jsonDecode(e) as Map<String, dynamic>))
        .toList();
  }

  @override
  void save(Pokemon pokemon) {
    final current = _prefs.getStringList(_key) ?? [];
    if (!isFavorite(pokemon.id)) {
      current.add(jsonEncode(pokemon.toJson()));
      _prefs.setStringList(_key, current);
    }
  }

  @override
  void remove(int id) {
    final current = _prefs.getStringList(_key) ?? [];
    current.removeWhere((e) {
      final m = jsonDecode(e) as Map<String, dynamic>;
      return m['id'] == id;
    });
    _prefs.setStringList(_key, current);
  }

  @override
  bool isFavorite(int id) {
    final current = _prefs.getStringList(_key) ?? [];
    return current.any((e) {
      final m = jsonDecode(e) as Map<String, dynamic>;
      return m['id'] == id;
    });
  }
}

@riverpod
FavoritesLocalDataSource favoritesLocalDataSource(Ref ref) {
  return FavoritesLocalDataSourceImpl(ref.watch(sharedPreferencesProvider));
}
