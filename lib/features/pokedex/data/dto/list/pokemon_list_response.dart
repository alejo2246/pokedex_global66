import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/pokemon.dart';
import '../../../../../core/constants/api_constants.dart';

part 'pokemon_list_response.freezed.dart';
part 'pokemon_list_response.g.dart';

@freezed
abstract class PokemonListResponse with _$PokemonListResponse {
  const factory PokemonListResponse({
    @JsonKey(name: "count") required int count,
    @JsonKey(name: "next") required String? next,
    @JsonKey(name: "previous") required dynamic previous,
    @JsonKey(name: "results") required List<PokemonEntryModel> results,
  }) = _PokemonListResponse;

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);
}

@freezed
abstract class PokemonEntryModel with _$PokemonEntryModel {
  const factory PokemonEntryModel({
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "url") required String url,
  }) = _PokemonEntryModel;

  factory PokemonEntryModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonEntryModelFromJson(json);
}

extension PokemonEntryModelX on PokemonEntryModel {
  int get id {
    final segments = url.split('/');
    return int.parse(segments[segments.length - 2]);
  }

  Pokemon toEntity() => Pokemon(
    id: id,
    name: name,
    imageUrl: ApiConstants.pokemonImageUrl(id),
    thumbnailUrl: ApiConstants.pokemonThumbnailUrl(id),
  );
}

extension PokemonListResponseX on PokemonListResponse {
  PokemonListResult toEntity() => PokemonListResult(
    count: count,
    next: next,
    pokemons: results.map((e) => e.toEntity()).toList(),
  );
}
