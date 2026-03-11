import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_species_response.freezed.dart';
part 'pokemon_species_response.g.dart';

@freezed
abstract class PokemonSpeciesResponse with _$PokemonSpeciesResponse {
  const factory PokemonSpeciesResponse({
    @JsonKey(name: 'gender_rate') required int genderRate,
    @JsonKey(name: 'flavor_text_entries')
    required List<FlavorTextEntry> flavorTextEntries,
    required List<Genus> genera,
  }) = _PokemonSpeciesResponse;

  factory PokemonSpeciesResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesResponseFromJson(json);
}

@freezed
abstract class FlavorTextEntry with _$FlavorTextEntry {
  const factory FlavorTextEntry({
    @JsonKey(name: 'flavor_text') required String flavorText,
    required SpeciesLanguage language,
  }) = _FlavorTextEntry;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntryFromJson(json);
}

@freezed
abstract class Genus with _$Genus {
  const factory Genus({
    required String genus,
    required SpeciesLanguage language,
  }) = _Genus;

  factory Genus.fromJson(Map<String, dynamic> json) => _$GenusFromJson(json);
}

@freezed
abstract class SpeciesLanguage with _$SpeciesLanguage {
  const factory SpeciesLanguage({
    required String name,
  }) = _SpeciesLanguage;

  factory SpeciesLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpeciesLanguageFromJson(json);
}
