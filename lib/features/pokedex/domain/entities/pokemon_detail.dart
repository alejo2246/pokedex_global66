import 'package:pokedex/core/constants/pokemon_type.dart';

class PokemonAbility {
  final String name;
  final bool isHidden;

  const PokemonAbility({required this.name, required this.isHidden});
}

class PokemonDetail {
  final double heightM;
  final double weightKg;
  final List<PokemonAbility> abilities;
  final String description;
  final String category;
 
  final int genderRate;
  final List<PokemonType> weaknesses;

  const PokemonDetail({
    required this.heightM,
    required this.weightKg,
    required this.abilities,
    required this.description,
    required this.category,
    required this.genderRate,
    required this.weaknesses,
  });
}
