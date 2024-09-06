import 'package:fpdart/fpdart.dart';
import 'package:zod/zod.dart';

/// Type alias for [Either<String, ZodDouble>]
typedef EitherZodDouble = Either<String, ZodDouble>;

/// A ZodDouble is a ZodType that represents a Double.
class ZodDouble extends ZodType {
  /// A ZodDouble is a ZodType that represents a Double.
  ZodDouble(this.value);

  /// The value of the ZodDouble.
  final double? value;

  /// Validates the current ZodDouble.
  EitherZodDouble call() => right(this);
}

/// Extension methods to validate [double]
extension ZodDoubleValidationExtension on EitherZodDouble {
  /// If the value is greater than the min value or not.
  EitherZodDouble min(double min, {bool inclusive = false, String? message}) {
    return flatMap(
      (a) => a.value != null && (inclusive ? a.value! <= min : a.value! < min)
          ? right(a)
          : left(message ?? 'double.min'),
    );
  }

  /// If the value is less than the max value or not.
  EitherZodDouble max(double max, {bool inclusive = false, String? message}) {
    return flatMap(
      (a) => a.value != null && (inclusive ? a.value! >= max : a.value! > max)
          ? right(a)
          : left(message ?? 'double.max'),
    );
  }

  /// If the value passed in is finite or not.
  EitherZodDouble finite({String? message}) {
    return flatMap(
      (a) => a.value != null && !a.value!.isFinite
          ? left(message ?? 'double.finite')
          : right(a),
    );
  }

  /// If the value passed in is infinite or not.
  EitherZodDouble infinite({String? message}) {
    return flatMap(
      (a) => a.value != null && !a.value!.isInfinite
          ? left(message ?? 'double.infinite')
          : right(a),
    );
  }

  /// If the value passed in is null or not.
  EitherZodDouble notNull({String? message}) {
    return flatMap(
      (a) => a.value != null ? right(a) : left(message ?? 'double.notNull'),
    );
  }

  /// If the value is an even number or not.
  EitherZodDouble even({String? message}) {
    return flatMap(
      (a) => a.value != null && a.value!.isEven
          ? right(a)
          : left(message ?? 'double.even'),
    );
  }

  /// If the value is an odd number or not.
  EitherZodDouble odd({String? message}) {
    return flatMap(
      (a) => a.value != null && a.value!.isOdd
          ? right(a)
          : left(message ?? 'double.odd'),
    );
  }

  /// If the value is a multiple of the multipleOf value or not.
  EitherZodDouble multipleOf(double multipleOf, {String? message}) {
    return flatMap(
      (a) => a.value != null && a.value! % multipleOf == 0
          ? right(a)
          : left(message ?? 'double.multipleOf'),
    );
  }

  /// If the value is a multiple of the multipleOf value or not.
  EitherZodDouble positive({String? message}) {
    return flatMap(
      (a) => a.value != null && a.value! > 0
          ? right(a)
          : left(message ?? 'double.positive'),
    );
  }

  /// If the value is a multiple of the multipleOf value or not.
  EitherZodDouble negative({String? message}) {
    return flatMap(
      (a) => a.value != null && a.value! < 0
          ? right(a)
          : left(message ?? 'double.negative'),
    );
  }

  /// If the value is a multiple of the multipleOf value or not.
  EitherZodDouble nonnegative({String? message}) {
    return flatMap(
      (a) => a.value != null && a.value! >= 0
          ? right(a)
          : left(message ?? 'double.nonnegative'),
    );
  }

  /// If the value is a multiple of the multipleOf value or not.
  EitherZodDouble nonpositive({String? message}) {
    return flatMap(
      (a) => a.value != null && a.value! <= 0
          ? right(a)
          : left(message ?? 'double.nonpositive'),
    );
  }
}
