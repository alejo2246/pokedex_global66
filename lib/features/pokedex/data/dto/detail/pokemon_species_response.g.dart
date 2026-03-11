// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PokemonSpeciesResponse _$PokemonSpeciesResponseFromJson(
  Map<String, dynamic> json,
) => _PokemonSpeciesResponse(
  genderRate: (json['gender_rate'] as num).toInt(),
  flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
      .map((e) => FlavorTextEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  genera: (json['genera'] as List<dynamic>)
      .map((e) => Genus.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PokemonSpeciesResponseToJson(
  _PokemonSpeciesResponse instance,
) => <String, dynamic>{
  'gender_rate': instance.genderRate,
  'flavor_text_entries': instance.flavorTextEntries,
  'genera': instance.genera,
};

_FlavorTextEntry _$FlavorTextEntryFromJson(Map<String, dynamic> json) =>
    _FlavorTextEntry(
      flavorText: json['flavor_text'] as String,
      language: SpeciesLanguage.fromJson(
        json['language'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$FlavorTextEntryToJson(_FlavorTextEntry instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
    };

_Genus _$GenusFromJson(Map<String, dynamic> json) => _Genus(
  genus: json['genus'] as String,
  language: SpeciesLanguage.fromJson(json['language'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GenusToJson(_Genus instance) => <String, dynamic>{
  'genus': instance.genus,
  'language': instance.language,
};

_SpeciesLanguage _$SpeciesLanguageFromJson(Map<String, dynamic> json) =>
    _SpeciesLanguage(name: json['name'] as String);

Map<String, dynamic> _$SpeciesLanguageToJson(_SpeciesLanguage instance) =>
    <String, dynamic>{'name': instance.name};
