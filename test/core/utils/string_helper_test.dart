import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/utils/string_helper.dart';

void main() {
  group('StringHelper', () {
    group('capitalize', () {
      test('capitalizes first letter of lowercase word', () {
        expect(StringHelper.capitalize('bulbasaur'), 'Bulbasaur');
      });

      test('leaves already-capitalized string unchanged', () {
        expect(StringHelper.capitalize('Pikachu'), 'Pikachu');
      });

      test('handles empty string', () {
        expect(StringHelper.capitalize(''), '');
      });

      test('handles single lowercase character', () {
        expect(StringHelper.capitalize('a'), 'A');
      });

      test('only capitalizes the first letter, not the rest', () {
        expect(StringHelper.capitalize('hello world'), 'Hello world');
      });

      test('handles string with spaces', () {
        expect(StringHelper.capitalize('mr. mime'), 'Mr. mime');
      });
    });

    group('formatId', () {
      test('pads single-digit id to 3 digits', () {
        expect(StringHelper.formatId('1'), 'Nº001');
      });

      test('pads two-digit id to 3 digits', () {
        expect(StringHelper.formatId('25'), 'Nº025');
      });

      test('does not pad exactly 3 digit id', () {
        expect(StringHelper.formatId('150'), 'Nº150');
      });

      test('does not truncate id longer than 3 digits', () {
        expect(StringHelper.formatId('1000'), 'Nº1000');
      });

      test('always adds Nº prefix', () {
        expect(StringHelper.formatId('5'), startsWith('Nº'));
      });
    });
  });
}
