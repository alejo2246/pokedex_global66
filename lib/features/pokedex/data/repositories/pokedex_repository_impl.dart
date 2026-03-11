import 'package:dio/dio.dart';
import 'package:pokedex/core/constants/api_constants.dart';
import 'package:pokedex/core/data/remote/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/pokemon_type.dart';
import '../../../../core/data/remote/dio_exception_handler.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/entities/pokemon_detail.dart';
import '../../domain/repositories/ipokedex_repository.dart';
import '../dto/list/pokemon_detail_response.dart';
import '../dto/detail/pokemon_full_response.dart';
import '../dto/list/pokemon_list_response.dart';
import '../dto/detail/pokemon_species_response.dart';
import '../dto/detail/pokemon_type_response.dart';

part 'pokedex_repository_impl.g.dart';

class PokedexRepositoryImpl implements IPokedexRepository {
  final Dio _dio;

  PokedexRepositoryImpl(this._dio);

  @override
  Future<Result<PokemonListResult>> getPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.pokemon,
        queryParameters: {'limit': limit, 'offset': offset},
      );

      final pokemonListResponse = PokemonListResponse.fromJson(response.data);

      return Success(pokemonListResponse.toEntity());
    } on DioException catch (e) {
      return handleDioException<PokemonListResult>(e);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<Pokemon>> getPokemonDetail(int id) async {
    try {
      final response = await _dio.get('${ApiConstants.pokemon}/$id');
      final detail = PokemonDetailResponse.fromJson(response.data);
      return Success(detail.toEntity());
    } on DioException catch (e) {
      return handleDioException<Pokemon>(e);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<PokemonDetail>> getPokemonFullDetail(int id) async {
    try {
      final responses = await Future.wait([
        _dio.get('${ApiConstants.pokemon}/$id'),
        _dio.get('${ApiConstants.pokemonSpecies}/$id'),
      ]);

      final full = PokemonFullResponse.fromJson(responses[0].data);
      final species = PokemonSpeciesResponse.fromJson(responses[1].data);

      final typeNames = full.types
          .map((s) => PokemonType.fromApiName(s.type.name))
          .toList();

      final typeResponses = await Future.wait(
        typeNames.map((t) => _dio.get('${ApiConstants.type}/${t.name}')),
      );

      final typeData = typeResponses
          .map((r) => PokemonTypeResponse.fromJson(r.data))
          .toList();

      return Success(
        PokemonDetail(
          heightM: full.height / 10,
          weightKg: full.weight / 10,
          abilities: full.abilities
              .map(
                (a) => PokemonAbility(
                  name: a.ability.name.replaceAll('-', ' '),
                  isHidden: a.isHidden,
                ),
              )
              .toList(),
          description: _parseDescription(species),
          category: _parseCategory(species),
          genderRate: species.genderRate,
          weaknesses: _calculateWeaknesses(typeData),
        ),
      );
    } on DioException catch (e) {
      return handleDioException<PokemonDetail>(e);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  String _parseDescription(PokemonSpeciesResponse species) {
    final entry = species.flavorTextEntries
        .where((e) => e.language.name == 'es')
        .firstOrNull;
    if (entry == null) return '';
    return entry.flavorText.replaceAll(RegExp(r'[\n\f\r]'), ' ').trim();
  }

  String _parseCategory(PokemonSpeciesResponse species) {
    final genus = species.genera
        .where((g) => g.language.name == 'es')
        .firstOrNull;
    if (genus == null) return '';
    return genus.genus.replaceAll(' Pokémon', '').trim();
  }


  List<PokemonType> _calculateWeaknesses(List<PokemonTypeResponse> typeData) {
    return PokemonType.values.where((attackingType) {
      double multiplier = 1.0;
      for (final type in typeData) {
        final relations = type.damageRelations;
        final apiName = attackingType.name;
        if (relations.noDamageFrom.any((t) => t.name == apiName)) {
          multiplier *= 0;
        } else if (relations.halfDamageFrom.any((t) => t.name == apiName)) {
          multiplier *= 0.5;
        } else if (relations.doubleDamageFrom.any((t) => t.name == apiName)) {
          multiplier *= 2;
        }
      }
      return multiplier > 1;
    }).toList();
  }
}

@riverpod
IPokedexRepository pokedexRepository(Ref ref) {
  final dio = ref.watch(networkServiceProvider);
  return PokedexRepositoryImpl(dio);
}
