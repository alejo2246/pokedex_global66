import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_full_response.freezed.dart';
part 'pokemon_full_response.g.dart';

@freezed
abstract class PokemonFullResponse with _$PokemonFullResponse {
  const factory PokemonFullResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'height') required int height,
    @JsonKey(name: 'weight') required int weight,
    @JsonKey(name: 'types') required List<FullTypeSlot> types,
    @JsonKey(name: 'abilities') required List<FullAbilitySlot> abilities,
  }) = _PokemonFullResponse;

  factory PokemonFullResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonFullResponseFromJson(json);
}

@freezed
abstract class FullTypeSlot with _$FullTypeSlot {
  const factory FullTypeSlot({
    @JsonKey(name: 'slot') required int slot,
    @JsonKey(name: 'type') required FullTypeName type,
  }) = _FullTypeSlot;

  factory FullTypeSlot.fromJson(Map<String, dynamic> json) =>
      _$FullTypeSlotFromJson(json);
}

@freezed
abstract class FullTypeName with _$FullTypeName {
  const factory FullTypeName({
    @JsonKey(name: 'name') required String name,
  }) = _FullTypeName;

  factory FullTypeName.fromJson(Map<String, dynamic> json) =>
      _$FullTypeNameFromJson(json);
}

@freezed
abstract class FullAbilitySlot with _$FullAbilitySlot {
  const factory FullAbilitySlot({
    @JsonKey(name: 'ability') required FullAbilityName ability,
    @JsonKey(name: 'is_hidden') required bool isHidden,
  }) = _FullAbilitySlot;

  factory FullAbilitySlot.fromJson(Map<String, dynamic> json) =>
      _$FullAbilitySlotFromJson(json);
}

@freezed
abstract class FullAbilityName with _$FullAbilityName {
  const factory FullAbilityName({
    @JsonKey(name: 'name') required String name,
  }) = _FullAbilityName;

  factory FullAbilityName.fromJson(Map<String, dynamic> json) =>
      _$FullAbilityNameFromJson(json);
}
