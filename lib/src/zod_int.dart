import 'package:fpdart/fpdart.dart';
import 'package:zod/zod.dart';

/// Type alias for [Either<String, ZodInt>]
typedef EitherZodInt = Either<String, ZodInt>;

/// A ZodInt is a ZodType that represents a Int.
class ZodInt extends ZodType {
  /// A ZodInt is a ZodType that represents a Int.
  ZodInt(this.value);

  /// The value of the ZodInt.
  final int? value;

  /// Validates the current ZodInt.
  EitherZodInt call() => right(this);
}

/// Extension methods to validate [int]
extension ZodIntValidationExtension on EitherZodInt {
  /// If the value is equal to the value passed in or not.
  EitherZodInt equalTo(int value, {String? message}) {
    return flatMap(
      (a) => a.value != null && a.value != value
          ? left(message ?? 'int.equalTo')
          : right(a),
    );
  }

  /// If the value is greater than the min value or not.
  EitherZodInt min(int min, {bool inclusive = false, String? message}) {
    return flatMap(
      (a) => a.value != null && (!inclusive ? a.value! <= min : a.value! < min)
          ? left(message ?? 'int.min')
          : right(a),
    );
  }

  /// If the value is less than the max value or not.
  EitherZodInt max(int max, {bool inclusive = false, String? message}) {
    return flatMap(
      (a) => a.value != null && (!inclusive ? a.value! >= max : a.value! > max)
          ? left(message ?? 'int.max')
          : right(a),
    );
  }

  /// If the value passed in is null or not.
  EitherZodInt notNull({String? message}) {
    return flatMap(
      (a) => a.value == null ? left(message ?? 'int.notNull') : right(a),
    );
  }

  /// If the value is an even number or not.
  EitherZodInt even({String? message}) {
    return flatMap(
      (a) => a.value == null || a.value!.isEven
          ? right(a)
          : left(message ?? 'int.even'),
    );
  }

  /// If the value is an odd number or not.
  EitherZodInt odd({String? message}) {
    return flatMap(
      (a) => a.value == null || a.value!.isOdd
          ? right(a)
          : left(message ?? 'int.odd'),
    );
  }

  /// If the value is a multiple of the multipleOf value or not.
  EitherZodInt multipleOf(int multipleOf, {String? message}) {
    return flatMap(
      (a) => a.value == null || a.value! % multipleOf == 0
          ? right(a)
          : left(message ?? 'int.multipleOf'),
    );
  }

  /// If the value is a multiple of the multipleOf value or not.
  EitherZodInt positive({String? message}) {
    return flatMap(
      (a) => a.value == null || a.value! > 0
          ? right(a)
          : left(message ?? 'int.positive'),
    );
  }

  /// If the value is a multiple of the multipleOf value or not.
  EitherZodInt negative({String? message}) {
    return flatMap(
      (a) => a.value == null || a.value! < 0
          ? right(a)
          : left(message ?? 'int.negative'),
    );
  }

  /// If the value is a multiple of the multipleOf value or not.
  EitherZodInt nonnegative({String? message}) {
    return flatMap(
      (a) => a.value == null || a.value! >= 0
          ? right(a)
          : left(message ?? 'int.nonnegative'),
    );
  }

  /// If the value is a multiple of the multipleOf value or not.
  EitherZodInt nonpositive({String? message}) {
    return flatMap(
      (a) => a.value == null || a.value! <= 0
          ? right(a)
          : left(message ?? 'int.nonpositive'),
    );
  }
}
