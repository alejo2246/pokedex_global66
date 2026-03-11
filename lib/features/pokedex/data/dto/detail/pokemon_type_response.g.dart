// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PokemonTypeResponse _$PokemonTypeResponseFromJson(Map<String, dynamic> json) =>
    _PokemonTypeResponse(
      name: json['name'] as String,
      damageRelations: TypeDamageRelations.fromJson(
        json['damage_relations'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PokemonTypeResponseToJson(
  _PokemonTypeResponse instance,
) => <String, dynamic>{
  'name': instance.name,
  'damage_relations': instance.damageRelations,
};

_TypeDamageRelations _$TypeDamageRelationsFromJson(Map<String, dynamic> json) =>
    _TypeDamageRelations(
      doubleDamageFrom: (json['double_damage_from'] as List<dynamic>)
          .map((e) => TypeNameRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      halfDamageFrom: (json['half_damage_from'] as List<dynamic>)
          .map((e) => TypeNameRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      noDamageFrom: (json['no_damage_from'] as List<dynamic>)
          .map((e) => TypeNameRef.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypeDamageRelationsToJson(
  _TypeDamageRelations instance,
) => <String, dynamic>{
  'double_damage_from': instance.doubleDamageFrom,
  'half_damage_from': instance.halfDamageFrom,
  'no_damage_from': instance.noDamageFrom,
};

_TypeNameRef _$TypeNameRefFromJson(Map<String, dynamic> json) =>
    _TypeNameRef(name: json['name'] as String);

Map<String, dynamic> _$TypeNameRefToJson(_TypeNameRef instance) =>
    <String, dynamic>{'name': instance.name};
