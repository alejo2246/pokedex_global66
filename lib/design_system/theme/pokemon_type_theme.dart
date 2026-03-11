import 'package:flutter/material.dart';

import '../../core/constants/pokemon_type.dart';

extension PokemonTypeTheme on PokemonType {
  Color get primaryColor => switch (this) {
    PokemonType.water => const Color(0xFF2196F3),
    PokemonType.dragon => const Color(0xFF00ACC1),
    PokemonType.electric => const Color(0xFFFDD835),
    PokemonType.fairy => const Color(0xFFE91E63),
    PokemonType.ghost => const Color(0xFF8E24AA),
    PokemonType.fire => const Color(0xFFFF9800),
    PokemonType.ice => const Color(0xFF3D8BFF),
    PokemonType.grass => const Color(0xFF8BC34A),
    PokemonType.bug => const Color(0xFF43A047),
    PokemonType.fighting => const Color(0xFFE53935),
    PokemonType.normal => const Color(0xFF546E7A),
    PokemonType.dark => const Color(0xFF546E7A),
    PokemonType.steel => const Color(0xFF546E7A),
    PokemonType.rock => const Color(0xFF795548),
    PokemonType.psychic => const Color(0xFF673AB7),
    PokemonType.ground => const Color(0xFFFFB300),
    PokemonType.poison => const Color(0xFF9C27B0),
    PokemonType.flying => const Color(0xFF00BCD4),
  };

  Color get softColor => primaryColor.withValues(alpha: 0.5);

  String get iconAsset => 'assets/icons/${name}_color.svg';

  String get iconAssetBlackAndWhite => 'assets/icons/$name.svg';
}
