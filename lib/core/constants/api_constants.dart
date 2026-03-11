class ApiConstants {
  static const String baseUrl = 'https://pokeapi.co/api/v2';
  static const String pokemon = '/pokemon';
  static const String pokemonSpecies = '/pokemon-species';
  static const String type = '/type';

  static String pokemonImageUrl(int id) =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  static String pokemonThumbnailUrl(int id) =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
}
