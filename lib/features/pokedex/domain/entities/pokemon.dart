import 'package:pokedex/core/constants/pokemon_type.dart';

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final String thumbnailUrl;
  final List<PokemonType> types;

  const Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.thumbnailUrl,
    this.types = const [],
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'thumbnailUrl': thumbnailUrl,
        'types': types.map((t) => t.name).toList(),
      };

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json['id'] as int,
        name: json['name'] as String,
        imageUrl: json['imageUrl'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String,
        types: (json['types'] as List<dynamic>)
            .map((t) => PokemonType.fromApiName(t as String))
            .toList(),
      );
}

class PokemonListResult {
  final int count;
  final String? next;
  final List<Pokemon> pokemons;

  const PokemonListResult({
    required this.count,
    this.next,
    required this.pokemons,
  });
}
