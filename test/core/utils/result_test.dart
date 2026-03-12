import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/utils/result.dart';

void main() {
  group('Result', () {
    group('Success', () {
      test('holds data value', () {
        const result = Success(42);
        expect(result.data, 42);
      });

      test('is a Result<T>', () {
        const result = Success('hello');
        expect(result, isA<Result<String>>());
      });

      test('holds null data for nullable type', () {
        const result = Success<String?>(null);
        expect(result.data, isNull);
      });
    });

    group('Failure', () {
      test('holds message', () {
        const result = Failure<int>('error message');
        expect(result.message, 'error message');
      });

      test('defaults type to unexpected', () {
        const result = Failure<int>('error');
        expect(result.type, FailureType.unexpected);
      });

      test('holds statusCode when provided', () {
        const result = Failure<int>(
          'not found',
          statusCode: 404,
          type: FailureType.server,
        );
        expect(result.statusCode, 404);
        expect(result.type, FailureType.server);
      });

      test('statusCode is null by default', () {
        const result = Failure<int>('error');
        expect(result.statusCode, isNull);
      });

      test('is a Result<T>', () {
        const result = Failure<String>('error');
        expect(result, isA<Result<String>>());
      });
    });

    group('FailureType', () {
      test('has all expected values', () {
        expect(FailureType.values, containsAll([
          FailureType.network,
          FailureType.server,
          FailureType.file,
          FailureType.unexpected,
        ]));
      });
    });

    group('pattern matching', () {
      test('matches Success branch', () {
        final Result<int> result = const Success(7);
        final value = switch (result) {
          Success(:final data) => data,
          Failure() => -1,
        };
        expect(value, 7);
      });

      test('matches Failure branch', () {
        final Result<int> result = const Failure('oops');
        final value = switch (result) {
          Success() => 0,
          Failure(:final message) => message,
        };
        expect(value, 'oops');
      });

      test('is Success check', () {
        const Result<int> result = Success(1);
        expect(result is Success<int>, isTrue);
        expect(result is Failure<int>, isFalse);
      });

      test('is Failure check', () {
        const Result<int> result = Failure('err');
        expect(result is Failure<int>, isTrue);
        expect(result is Success<int>, isFalse);
      });
    });
  });
}
