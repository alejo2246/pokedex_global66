// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_full_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PokemonFullResponse _$PokemonFullResponseFromJson(Map<String, dynamic> json) =>
    _PokemonFullResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      types: (json['types'] as List<dynamic>)
          .map((e) => FullTypeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => FullAbilitySlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonFullResponseToJson(
  _PokemonFullResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'height': instance.height,
  'weight': instance.weight,
  'types': instance.types,
  'abilities': instance.abilities,
};

_FullTypeSlot _$FullTypeSlotFromJson(Map<String, dynamic> json) =>
    _FullTypeSlot(
      slot: (json['slot'] as num).toInt(),
      type: FullTypeName.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FullTypeSlotToJson(_FullTypeSlot instance) =>
    <String, dynamic>{'slot': instance.slot, 'type': instance.type};

_FullTypeName _$FullTypeNameFromJson(Map<String, dynamic> json) =>
    _FullTypeName(name: json['name'] as String);

Map<String, dynamic> _$FullTypeNameToJson(_FullTypeName instance) =>
    <String, dynamic>{'name': instance.name};

_FullAbilitySlot _$FullAbilitySlotFromJson(Map<String, dynamic> json) =>
    _FullAbilitySlot(
      ability: FullAbilityName.fromJson(
        json['ability'] as Map<String, dynamic>,
      ),
      isHidden: json['is_hidden'] as bool,
    );

Map<String, dynamic> _$FullAbilitySlotToJson(_FullAbilitySlot instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
    };

_FullAbilityName _$FullAbilityNameFromJson(Map<String, dynamic> json) =>
    _FullAbilityName(name: json['name'] as String);

Map<String, dynamic> _$FullAbilityNameToJson(_FullAbilityName instance) =>
    <String, dynamic>{'name': instance.name};
