import 'package:test/test.dart';
import 'package:zod/zod.dart';

void main() {
  group('Zod', () {
    group('zodString', () {
      test('returns right for a valid string', () {
        final result = Zod.zodString('test');
        expect(result.isRight(), isTrue);
        expect(result.getRight().toNullable()?.value, equals('test'));
      });

      test('returns right for null', () {
        final result = Zod.zodString(null);
        expect(result.isRight(), isTrue);
        expect(result.getRight().toNullable()?.value, isNull);
      });
    });

    group('zodInt', () {
      test('returns right for a valid integer', () {
        final result = Zod.zodInt(42);
        expect(result.isRight(), isTrue);
        expect(result.getRight().toNullable()?.value, equals(42));
      });

      test('returns right for null', () {
        final result = Zod.zodInt(null);
        expect(result.isRight(), isTrue);
        expect(result.getRight().toNullable()?.value, isNull);
      });
    });

    group('zodDouble', () {
      test('returns right for a valid double', () {
        final result = Zod.zodDouble(3.14);
        expect(result.isRight(), isTrue);
        expect(result.getRight().toNullable()?.value, equals(3.14));
      });

      test('returns right for null', () {
        final result = Zod.zodDouble(null);
        expect(result.isRight(), isTrue);
        expect(result.getRight().toNullable()?.value, isNull);
      });
    });

    group('zodList', () {
      test('returns right for a valid list without element validation', () {
        final result = Zod.zodList(['a', 'b', 'c']);
        expect(result.isRight(), isTrue);
        expect(result.getRight().toNullable()?.value, equals(['a', 'b', 'c']));
      });

      test('returns right for a valid list with valid element validation', () {
        final result = Zod.zodList(
          ['a', 'b', 'c'],
          elements: (e) => Zod.zodString(e).min(1),
        );
        expect(result.isRight(), isTrue);
      });

      test('returns left for a list with invalid element validation', () {
        final result = Zod.zodList(
          ['a', '', 'c'],
          elements: (e) => Zod.zodString(e).min(1),
        );
        expect(result.isLeft(), isTrue);
      });

      test('returns right for an empty list', () {
        final result = Zod.zodList([]);
        expect(result.isRight(), isTrue);
        expect(result.getRight().toNullable()?.value, isEmpty);
      });
    });
  });
}
