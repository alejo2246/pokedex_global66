// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PokemonDetailResponse _$PokemonDetailResponseFromJson(
  Map<String, dynamic> json,
) => _PokemonDetailResponse(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  types: (json['types'] as List<dynamic>)
      .map((e) => PokemonTypeSlot.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PokemonDetailResponseToJson(
  _PokemonDetailResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'types': instance.types,
};

_PokemonTypeSlot _$PokemonTypeSlotFromJson(Map<String, dynamic> json) =>
    _PokemonTypeSlot(
      slot: (json['slot'] as num).toInt(),
      type: PokemonTypeInfo.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeSlotToJson(_PokemonTypeSlot instance) =>
    <String, dynamic>{'slot': instance.slot, 'type': instance.type};

_PokemonTypeInfo _$PokemonTypeInfoFromJson(Map<String, dynamic> json) =>
    _PokemonTypeInfo(name: json['name'] as String);

Map<String, dynamic> _$PokemonTypeInfoToJson(_PokemonTypeInfo instance) =>
    <String, dynamic>{'name': instance.name};
