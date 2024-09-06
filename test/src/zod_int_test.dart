import 'package:test/test.dart';
import 'package:zod/src/zod_int.dart';

void main() {
  group('ZodInt', () {
    test('returns right on call', () {
      final result = ZodInt(5)();
      expect(result.isRight(), isTrue);
    });

    group('equalTo', () {
      test('returns right when value is equal', () {
        final result = ZodInt(5)().equalTo(5);
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is not equal', () {
        final result = ZodInt(5)().equalTo(6);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodInt(null)().equalTo(5);
        expect(result.isRight(), isTrue);
      });
    });

    group('min', () {
      test('returns right when value is greater than min', () {
        final result = ZodInt(5)().min(3);
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is less than min', () {
        final result = ZodInt(2)().min(3);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is equal to min and inclusive', () {
        final result = ZodInt(3)().min(3, inclusive: true);
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is equal to min and not inclusive', () {
        final result = ZodInt(3)().min(3);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodInt(null)().min(3);
        expect(result.isRight(), isTrue);
      });
    });

    group('max', () {
      test('returns right when value is less than max', () {
        final result = ZodInt(3)().max(5);
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is greater than max', () {
        final result = ZodInt(6)().max(5);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is equal to max and inclusive', () {
        final result = ZodInt(5)().max(5, inclusive: true);
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is equal to max and not inclusive', () {
        final result = ZodInt(5)().max(5);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodInt(null)().max(5);
        expect(result.isRight(), isTrue);
      });
    });

    group('notNull', () {
      test('returns right when value is not null', () {
        final result = ZodInt(5)().notNull();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is null', () {
        final result = ZodInt(null)().notNull();
        expect(result.isLeft(), isTrue);
      });
    });

    group('even', () {
      test('returns right when value is even', () {
        final result = ZodInt(4)().even();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is odd', () {
        final result = ZodInt(5)().even();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodInt(null)().even();
        expect(result.isRight(), isTrue);
      });
    });

    group('odd', () {
      test('returns right when value is odd', () {
        final result = ZodInt(5)().odd();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is even', () {
        final result = ZodInt(4)().odd();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodInt(null)().odd();
        expect(result.isRight(), isTrue);
      });
    });

    group('multipleOf', () {
      test('returns right when value is a multiple of the given number', () {
        final result = ZodInt(9)().multipleOf(3);
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is not a multiple of the given number', () {
        final result = ZodInt(10)().multipleOf(3);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodInt(null)().multipleOf(3);
        expect(result.isRight(), isTrue);
      });
    });

    group('positive', () {
      test('returns right when value is positive', () {
        final result = ZodInt(5)().positive();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is zero', () {
        final result = ZodInt(0)().positive();
        expect(result.isLeft(), isTrue);
      });

      test('returns left when value is negative', () {
        final result = ZodInt(-5)().positive();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodInt(null)().positive();
        expect(result.isRight(), isTrue);
      });
    });

    group('negative', () {
      test('returns right when value is negative', () {
        final result = ZodInt(-5)().negative();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is zero', () {
        final result = ZodInt(0)().negative();
        expect(result.isLeft(), isTrue);
      });

      test('returns left when value is positive', () {
        final result = ZodInt(5)().negative();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodInt(null)().negative();
        expect(result.isRight(), isTrue);
      });
    });

    group('nonnegative', () {
      test('returns right when value is positive', () {
        final result = ZodInt(5)().nonnegative();
        expect(result.isRight(), isTrue);
      });

      test('returns right when value is zero', () {
        final result = ZodInt(0)().nonnegative();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is negative', () {
        final result = ZodInt(-5)().nonnegative();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodInt(null)().nonnegative();
        expect(result.isRight(), isTrue);
      });
    });

    group('nonpositive', () {
      test('returns right when value is negative', () {
        final result = ZodInt(-5)().nonpositive();
        expect(result.isRight(), isTrue);
      });

      test('returns right when value is zero', () {
        final result = ZodInt(0)().nonpositive();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is positive', () {
        final result = ZodInt(5)().nonpositive();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodInt(null)().nonpositive();
        expect(result.isRight(), isTrue);
      });
    });
  });
}
