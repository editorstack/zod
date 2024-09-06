import 'package:test/test.dart';
import 'package:zod/src/zod_double.dart';

void main() {
  group('ZodDouble', () {
    test('returns right on call', () {
      final result = ZodDouble(1.5)();
      expect(result.isRight(), isTrue);
    });

    group('min', () {
      test('returns right when value is greater than min', () {
        final result = ZodDouble(5)().min(3);
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is less than min', () {
        final result = ZodDouble(2)().min(3);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is equal to min and inclusive', () {
        final result = ZodDouble(3)().min(3, inclusive: true);
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is equal to min and not inclusive', () {
        final result = ZodDouble(3)().min(3);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodDouble(null)().min(3);
        expect(result.isRight(), isTrue);
      });

      test('returns left with custom message', () {
        final result = ZodDouble(2)().min(3, message: 'Custom error');
        expect(result.isLeft(), isTrue);
        expect(result.getLeft().toNullable(), equals('Custom error'));
      });
    });

    group('max', () {
      test('returns right when value is less than max', () {
        final result = ZodDouble(3)().max(5);
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is greater than max', () {
        final result = ZodDouble(6)().max(5);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is equal to max and inclusive', () {
        final result = ZodDouble(5)().max(5, inclusive: true);
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is equal to max and not inclusive', () {
        final result = ZodDouble(5)().max(5);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodDouble(null)().max(5);
        expect(result.isRight(), isTrue);
      });

      test('returns left with custom message', () {
        final result = ZodDouble(6)().max(5, message: 'Custom error');
        expect(result.isLeft(), isTrue);
        expect(result.getLeft().toNullable(), equals('Custom error'));
      });
    });

    group('finite', () {
      test('returns right when value is finite', () {
        final result = ZodDouble(3.14)().finite();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is infinite', () {
        final result = ZodDouble(double.infinity)().finite();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodDouble(null)().finite();
        expect(result.isRight(), isTrue);
      });
    });

    group('infinite', () {
      test('returns right when value is infinite', () {
        final result = ZodDouble(double.infinity)().infinite();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is finite', () {
        final result = ZodDouble(3.14)().infinite();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodDouble(null)().infinite();
        expect(result.isRight(), isTrue);
      });
    });

    group('notNull', () {
      test('returns right when value is not null', () {
        final result = ZodDouble(3.14)().notNull();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is null', () {
        final result = ZodDouble(null)().notNull();
        expect(result.isLeft(), isTrue);
      });
    });

    group('multipleOf', () {
      test('returns right when value is a multiple of the given number', () {
        final result = ZodDouble(9)().multipleOf(3);
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is not a multiple of the given number', () {
        final result = ZodDouble(10)().multipleOf(3);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodDouble(null)().multipleOf(3);
        expect(result.isRight(), isTrue);
      });
    });

    group('positive', () {
      test('returns right when value is positive', () {
        final result = ZodDouble(5)().positive();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is zero', () {
        final result = ZodDouble(0)().positive();
        expect(result.isLeft(), isTrue);
      });

      test('returns left when value is negative', () {
        final result = ZodDouble(-5)().positive();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodDouble(null)().positive();
        expect(result.isRight(), isTrue);
      });
    });

    group('negative', () {
      test('returns right when value is negative', () {
        final result = ZodDouble(-5)().negative();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is zero', () {
        final result = ZodDouble(0)().negative();
        expect(result.isLeft(), isTrue);
      });

      test('returns left when value is positive', () {
        final result = ZodDouble(5)().negative();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodDouble(null)().negative();
        expect(result.isRight(), isTrue);
      });
    });

    group('nonnegative', () {
      test('returns right when value is positive', () {
        final result = ZodDouble(5)().nonnegative();
        expect(result.isRight(), isTrue);
      });

      test('returns right when value is zero', () {
        final result = ZodDouble(0)().nonnegative();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is negative', () {
        final result = ZodDouble(-5)().nonnegative();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodDouble(null)().nonnegative();
        expect(result.isRight(), isTrue);
      });
    });

    group('nonpositive', () {
      test('returns right when value is negative', () {
        final result = ZodDouble(-5)().nonpositive();
        expect(result.isRight(), isTrue);
      });

      test('returns right when value is zero', () {
        final result = ZodDouble(0)().nonpositive();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is positive', () {
        final result = ZodDouble(5)().nonpositive();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodDouble(null)().nonpositive();
        expect(result.isRight(), isTrue);
      });
    });
  });
}
