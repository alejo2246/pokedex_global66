import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/result.dart';
import '../../domain/entities/pokemon_detail.dart';
import '../../domain/usecases/get_pokemon_detail_usecase.dart';

part 'pokemon_detail_viewmodel.g.dart';

@riverpod
class PokemonDetailViewModel extends _$PokemonDetailViewModel {
  @override
  Future<PokemonDetail> build(int id) async {
    final result = await ref.read(getPokemonDetailUseCaseProvider).call(id);
    switch (result) {
      case Success(:final data):
        return data;
      case Failure(:final message):
        throw Exception(message);
    }
  }
}
