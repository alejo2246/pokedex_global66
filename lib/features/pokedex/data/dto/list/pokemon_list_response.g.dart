// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PokemonListResponse _$PokemonListResponseFromJson(Map<String, dynamic> json) =>
    _PokemonListResponse(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'],
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonEntryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonListResponseToJson(
  _PokemonListResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};

_PokemonEntryModel _$PokemonEntryModelFromJson(Map<String, dynamic> json) =>
    _PokemonEntryModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonEntryModelToJson(_PokemonEntryModel instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
