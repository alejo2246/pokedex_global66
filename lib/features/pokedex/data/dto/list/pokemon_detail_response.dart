import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/pokemon.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/pokemon_type.dart';

part 'pokemon_detail_response.freezed.dart';
part 'pokemon_detail_response.g.dart';

@freezed
abstract class PokemonDetailResponse with _$PokemonDetailResponse {
  const factory PokemonDetailResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'types') required List<PokemonTypeSlot> types,
  }) = _PokemonDetailResponse;

  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailResponseFromJson(json);
}

@freezed
abstract class PokemonTypeSlot with _$PokemonTypeSlot {
  const factory PokemonTypeSlot({
    @JsonKey(name: 'slot') required int slot,
    @JsonKey(name: 'type') required PokemonTypeInfo type,
  }) = _PokemonTypeSlot;

  factory PokemonTypeSlot.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSlotFromJson(json);
}

@freezed
abstract class PokemonTypeInfo with _$PokemonTypeInfo {
  const factory PokemonTypeInfo({
    @JsonKey(name: 'name') required String name,
  }) = _PokemonTypeInfo;

  factory PokemonTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeInfoFromJson(json);
}

extension PokemonDetailResponseX on PokemonDetailResponse {
  Pokemon toEntity() => Pokemon(
    id: id,
    name: name,
    imageUrl: ApiConstants.pokemonImageUrl(id),
    thumbnailUrl: ApiConstants.pokemonThumbnailUrl(id),
    types: types.map((slot) => PokemonType.fromApiName(slot.type.name)).toList(),
  );
}
