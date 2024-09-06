import 'package:test/test.dart';
import 'package:zod/src/zod_string.dart';

void main() {
  group('ZodString', () {
    test('returns right on call', () {
      final result = ZodString('test')();
      expect(result.isRight(), isTrue);
    });

    group('min', () {
      test('returns right when string length is greater than or equal to min',
          () {
        final result = ZodString('test')().min(3);
        expect(result.isRight(), isTrue);
      });

      test('returns right when string length is exactly min', () {
        final result = ZodString('test')().min(4);
        expect(result.isRight(), isTrue);
      });

      test('returns left when string length is less than min', () {
        final result = ZodString('test')().min(5);
        expect(result.isLeft(), isTrue);
      });

      test(
          'returns left with custom message when string length is less than min',
          () {
        final result = ZodString('test')().min(5, message: 'Custom error');
        expect(result.isLeft(), isTrue);
        expect(result.getLeft().toNullable(), equals('Custom error'));
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().min(5);
        expect(result.isRight(), isTrue);
      });
    });

    group('max', () {
      test('returns right when string length is less than max', () {
        final result = ZodString('test')().max(5);
        expect(result.isRight(), isTrue);
      });

      test('returns right when string length is exactly max', () {
        final result = ZodString('test')().max(4);
        expect(result.isRight(), isTrue);
      });

      test('returns left when string length is greater than max', () {
        final result = ZodString('test')().max(3);
        expect(result.isLeft(), isTrue);
      });

      test(
          'returns left with custom message when string length is greater than max',
          () {
        final result = ZodString('test')().max(3, message: 'Custom error');
        expect(result.isLeft(), isTrue);
        expect(result.getLeft().toNullable(), equals('Custom error'));
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().max(3);
        expect(result.isRight(), isTrue);
      });
    });

    group('length', () {
      test('returns right when string length is equal to specified length', () {
        final result = ZodString('test')().lengthEqual(4);
        expect(result.isRight(), isTrue);
      });

      test('returns left when string length is not equal to specified length',
          () {
        final result = ZodString('test')().lengthEqual(5);
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().lengthEqual(4);
        expect(result.isRight(), isTrue);
      });
    });

    group('email', () {
      test('returns right for valid email', () {
        final result = ZodString('test@example.com')().email();
        expect(result.isRight(), isTrue);
      });

      test('returns left for invalid email', () {
        final result = ZodString('invalid-email')().email();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().email();
        expect(result.isRight(), isTrue);
      });
    });

    group('url', () {
      test('returns right for valid URL', () {
        final result = ZodString('https://example.com')().url();
        expect(result.isRight(), isTrue);
      });

      test('returns left for invalid URL', () {
        final result = ZodString('not-a-url')().url();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().url();
        expect(result.isRight(), isTrue);
      });
    });

    group('uuid', () {
      test('returns right for valid UUID', () {
        final result =
            ZodString('123e4567-e89b-12d3-a456-426614174000')().uuid();
        expect(result.isRight(), isTrue);
      });

      test('returns left for invalid UUID', () {
        final result = ZodString('not-a-uuid')().uuid();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().uuid();
        expect(result.isRight(), isTrue);
      });
    });

    group('nanoid', () {
      test('returns right for valid nanoid', () {
        final result = ZodString('abcd1234efghijklmnopq')().nanoid();
        expect(result.isRight(), isTrue);
      });

      test('returns left for invalid nanoid', () {
        final result = ZodString('too-short')().nanoid();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().nanoid();
        expect(result.isRight(), isTrue);
      });
    });

    group('cuid', () {
      test('returns right for valid cuid', () {
        final result = ZodString('cjld2cjxh0000qzrmn831i7rn')().cuid();
        expect(result.isRight(), isTrue);
      });

      test('returns left for invalid cuid', () {
        final result = ZodString('not-a-cuid')().cuid();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().cuid();
        expect(result.isRight(), isTrue);
      });
    });

    group('cuid2', () {
      test('returns right for valid cuid2', () {
        final result = ZodString('tz4a98xxat96iws9zmbrgj3a')().cuid2();
        expect(result.isRight(), isTrue);
      });

      test('returns left for invalid cuid2', () {
        final result = ZodString('not-a-cuid2')().cuid2();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().cuid2();
        expect(result.isRight(), isTrue);
      });
    });

    group('ulid', () {
      test('returns right for valid ulid', () {
        final result = ZodString('01ARZ3NDEKTSV4RRFFQ69G5FAV')().ulid();
        expect(result.isRight(), isTrue);
      });

      test('returns left for invalid ulid', () {
        final result = ZodString('not-a-ulid')().ulid();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().ulid();
        expect(result.isRight(), isTrue);
      });
    });

    group('startsWith', () {
      test('returns right when string starts with prefix', () {
        final result = ZodString('hello world')().startsWith('hello');
        expect(result.isRight(), isTrue);
      });

      test('returns left when string does not start with prefix', () {
        final result = ZodString('hello world')().startsWith('world');
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().startsWith('hello');
        expect(result.isRight(), isTrue);
      });
    });

    group('endsWith', () {
      test('returns right when string ends with suffix', () {
        final result = ZodString('hello world')().endsWith('world');
        expect(result.isRight(), isTrue);
      });

      test('returns left when string does not end with suffix', () {
        final result = ZodString('hello world')().endsWith('hello');
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().endsWith('world');
        expect(result.isRight(), isTrue);
      });
    });

    group('contains', () {
      test('returns right when string contains substring', () {
        final result = ZodString('hello world')().contains('lo wo');
        expect(result.isRight(), isTrue);
      });

      test('returns left when string does not contain substring', () {
        final result = ZodString('hello world')().contains('foo');
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().contains('lo wo');
        expect(result.isRight(), isTrue);
      });
    });

    group('regex', () {
      test('returns right when string matches pattern', () {
        final result = ZodString('123')().regex(r'^\d+$');
        expect(result.isRight(), isTrue);
      });

      test('returns left when string does not match pattern', () {
        final result = ZodString('abc')().regex(r'^\d+$');
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().regex(r'^\d+$');
        expect(result.isRight(), isTrue);
      });
    });

    group('ipv4', () {
      test('returns right for valid IPv4 address', () {
        final result = ZodString('192.168.0.1')().ipv4();
        expect(result.isRight(), isTrue);
      });

      test('returns left for invalid IPv4 address', () {
        final result = ZodString('256.0.0.1')().ipv4();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().ipv4();
        expect(result.isRight(), isTrue);
      });
    });

    group('ipv6', () {
      test('returns right for valid IPv6 address', () {
        final result =
            ZodString('2001:0db8:85a3:0000:0000:8a2e:0370:7334')().ipv6();
        expect(result.isRight(), isTrue);
      });

      test('returns left for invalid IPv6 address', () {
        final result = ZodString('not-an-ipv6-address')().ipv6();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().ipv6();
        expect(result.isRight(), isTrue);
      });
    });

    group('base64', () {
      test('returns right for valid base64 string', () {
        final result = ZodString('SGVsbG8gV29ybGQ=')().base64();
        expect(result.isRight(), isTrue);
      });

      test('returns left for invalid base64 string', () {
        final result = ZodString('not-base64')().base64();
        expect(result.isLeft(), isTrue);
      });

      test('returns right when value is null', () {
        final result = ZodString(null)().base64();
        expect(result.isRight(), isTrue);
      });
    });

    group('notNull', () {
      test('returns right when value is not null', () {
        final result = ZodString('test')().notNull();
        expect(result.isRight(), isTrue);
      });

      test('returns left when value is null', () {
        final result = ZodString(null)().notNull();
        expect(result.isLeft(), isTrue);
      });
    });
  });
}
