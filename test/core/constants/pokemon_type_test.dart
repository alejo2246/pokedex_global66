import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/constants/pokemon_type.dart';

void main() {
  group('PokemonType', () {
    group('displayName', () {
      test('returns Spanish name for water', () {
        expect(PokemonType.water.displayName, 'Agua');
      });

      test('returns Spanish name for fire', () {
        expect(PokemonType.fire.displayName, 'Fuego');
      });

      test('returns Spanish name for grass', () {
        expect(PokemonType.grass.displayName, 'Planta');
      });

      test('returns Spanish name for electric', () {
        expect(PokemonType.electric.displayName, 'Eléctrico');
      });

      test('returns Spanish name for dragon', () {
        expect(PokemonType.dragon.displayName, 'Dragón');
      });

      test('returns Spanish name for ghost', () {
        expect(PokemonType.ghost.displayName, 'Fantasma');
      });

      test('every type has a non-empty displayName', () {
        for (final type in PokemonType.values) {
          expect(
            type.displayName,
            isNotEmpty,
            reason: '${type.name} has empty displayName',
          );
        }
      });
    });

    group('fromApiName', () {
      test('returns matching type for exact lowercase name', () {
        expect(PokemonType.fromApiName('water'), PokemonType.water);
        expect(PokemonType.fromApiName('fire'), PokemonType.fire);
        expect(PokemonType.fromApiName('grass'), PokemonType.grass);
        expect(PokemonType.fromApiName('electric'), PokemonType.electric);
        expect(PokemonType.fromApiName('poison'), PokemonType.poison);
      });

      test('is case-insensitive', () {
        expect(PokemonType.fromApiName('WATER'), PokemonType.water);
        expect(PokemonType.fromApiName('Fire'), PokemonType.fire);
        expect(PokemonType.fromApiName('GRASS'), PokemonType.grass);
      });

      test('returns normal for unknown api name', () {
        expect(PokemonType.fromApiName('unknown_type'), PokemonType.normal);
      });

      test('returns normal for empty string', () {
        expect(PokemonType.fromApiName(''), PokemonType.normal);
      });

      test('round-trips: fromApiName(type.name) == type for all types', () {
        for (final type in PokemonType.values) {
          expect(
            PokemonType.fromApiName(type.name),
            type,
            reason: 'failed round-trip for ${type.name}',
          );
        }
      });
    });
  });
}
