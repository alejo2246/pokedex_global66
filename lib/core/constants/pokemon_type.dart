enum PokemonType {
  water,
  dragon,
  electric,
  fairy,
  ghost,
  fire,
  ice,
  grass,
  bug,
  fighting,
  normal,
  dark,
  steel,
  rock,
  psychic,
  ground,
  poison,
  flying;

  String get displayName => switch (this) {
        PokemonType.water    => 'Agua',
        PokemonType.dragon   => 'Dragón',
        PokemonType.electric => 'Eléctrico',
        PokemonType.fairy    => 'Hada',
        PokemonType.ghost    => 'Fantasma',
        PokemonType.fire     => 'Fuego',
        PokemonType.ice      => 'Hielo',
        PokemonType.grass    => 'Planta',
        PokemonType.bug      => 'Bicho',
        PokemonType.fighting => 'Lucha',
        PokemonType.normal   => 'Normal',
        PokemonType.dark     => 'Siniestro',
        PokemonType.steel    => 'Acero',
        PokemonType.rock     => 'Roca',
        PokemonType.psychic  => 'Psíquico',
        PokemonType.ground   => 'Tierra',
        PokemonType.poison   => 'Veneno',
        PokemonType.flying   => 'Volador',
      };

  static PokemonType fromApiName(String apiName) {
    return PokemonType.values.firstWhere(
      (t) => t.name == apiName.toLowerCase(),
      orElse: () => PokemonType.normal,
    );
  }
}
