import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_type_response.freezed.dart';
part 'pokemon_type_response.g.dart';

@freezed
abstract class PokemonTypeResponse with _$PokemonTypeResponse {
  const factory PokemonTypeResponse({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'damage_relations')
    required TypeDamageRelations damageRelations,
  }) = _PokemonTypeResponse;

  factory PokemonTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeResponseFromJson(json);
}

@freezed
abstract class TypeDamageRelations with _$TypeDamageRelations {
  const factory TypeDamageRelations({
    @JsonKey(name: 'double_damage_from')
    required List<TypeNameRef> doubleDamageFrom,
    @JsonKey(name: 'half_damage_from') required List<TypeNameRef> halfDamageFrom,
    @JsonKey(name: 'no_damage_from') required List<TypeNameRef> noDamageFrom,
  }) = _TypeDamageRelations;

  factory TypeDamageRelations.fromJson(Map<String, dynamic> json) =>
      _$TypeDamageRelationsFromJson(json);
}

@freezed
abstract class TypeNameRef with _$TypeNameRef {
  const factory TypeNameRef({
    @JsonKey(name: 'name') required String name,
  }) = _TypeNameRef;

  factory TypeNameRef.fromJson(Map<String, dynamic> json) =>
      _$TypeNameRefFromJson(json);
}
