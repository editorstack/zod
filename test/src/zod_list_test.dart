import 'package:test/test.dart';
import 'package:zod/src/zod_list.dart';
import 'package:zod/src/zod_string.dart';

void main() {
  group('ZodList', () {
    test('returns right on call without elements validation', () {
      final result = ZodList<String>(['a', 'b', 'c'])();
      expect(result.isRight(), isTrue);
    });

    test('returns right on call with valid elements', () {
      final result = ZodList<String>(['a', 'b', 'c'],
          elements: (e) => ZodString(e)().min(1))();
      expect(result.isRight(), isTrue);
    });

    test('returns left on call with invalid elements', () {
      final result = ZodList<String>(['a', '', 'c'],
          elements: (e) => ZodString(e)().min(1))();
      expect(result.isLeft(), isTrue);
    });

    test('returns right when value is null', () {
      final result = ZodList<String>(null)();
      expect(result.isRight(), isTrue);
    });

    group('min', () {
      test('returns right when list length is greater than or equal to min',
          () {
        final result = ZodList<String>(['a', 'b', 'c'])().min(3);
        expect(result.isRight(), isTrue);
      });

      test('returns left when list length is less than min', () {
        final result = ZodList<String>(['a', 'b'])().min(3);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodList<String>(null)().min(3);
        expect(result.isRight(), isTrue);
      });

      test('returns left with custom message', () {
        final result =
            ZodList<String>(['a', 'b'])().min(3, message: 'Custom error');
        expect(result.isLeft(), isTrue);
        expect(result.getLeft().toNullable(), equals('Custom error'));
      });
    });

    group('max', () {
      test('returns right when list length is less than or equal to max', () {
        final result = ZodList<String>(['a', 'b', 'c'])().max(3);
        expect(result.isRight(), isTrue);
      });

      test('returns left when list length is greater than max', () {
        final result = ZodList<String>(['a', 'b', 'c', 'd'])().max(3);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodList<String>(null)().max(3);
        expect(result.isRight(), isTrue);
      });

      test('returns left with custom message', () {
        final result = ZodList<String>(['a', 'b', 'c', 'd'])()
            .max(3, message: 'Custom error');
        expect(result.isLeft(), isTrue);
        expect(result.getLeft().toNullable(), equals('Custom error'));
      });
    });

    group('exactLength', () {
      test('returns right when list length is equal to specified length', () {
        final result = ZodList<String>(['a', 'b', 'c'])().exactLength(3);
        expect(result.isRight(), isTrue);
      });

      test('returns left when list length is not equal to specified length',
          () {
        final result = ZodList<String>(['a', 'b'])().exactLength(3);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodList<String>(null)().exactLength(3);
        expect(result.isRight(), isTrue);
      });

      test('returns left with custom message', () {
        final result = ZodList<String>(['a', 'b'])()
            .exactLength(3, message: 'Custom error');
        expect(result.isLeft(), isTrue);
        expect(result.getLeft().toNullable(), equals('Custom error'));
      });
    });

    group('notNull', () {
      test('returns right when value is not null', () {
        final result = ZodList<String>(['a', 'b', 'c'])().notNull();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is null', () {
        final result = ZodList<String>(null)().notNull();
        expect(result.isLeft(), isTrue);
      });

      test('returns left with custom message', () {
        final result = ZodList<String>(null)().notNull(message: 'Custom error');
        expect(result.isLeft(), isTrue);
        expect(result.getLeft().toNullable(), equals('Custom error'));
      });
    });
  });
}
