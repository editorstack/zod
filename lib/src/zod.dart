import 'package:fpdart/fpdart.dart';
import 'package:zod/src/zod_double.dart';
import 'package:zod/src/zod_int.dart';
import 'package:zod/src/zod_list.dart';
import 'package:zod/src/zod_string.dart';

/// Class for creating ZodTypes which can be used to validate data such as
/// strings, numbers, and lists.
class Zod {
  /// Creates a ZodString type. Used to validate strings.
  static EitherZodString zodString(String? value) => ZodString(value)();

  /// Creates a ZodInt type. Used to validate integers.
  static EitherZodInt zodInt(int? value) => ZodInt(value)();

  /// Creates a ZodDouble type. Used to validate doubles.
  static EitherZodDouble zodDouble(double? value) => ZodDouble(value)();

  /// Creates a ZodList type. Used to validate lists. You can also use the
  /// elements property to specify a custom validation for each element in the
  /// list.
  static EitherZodList<T> zodList<T>(
    List<T> type, {
    EitherZodType Function(T element)? elements,
  }) =>
      ZodList(type, elements: elements)();
}

/// Type alias for [Either<String, ZodType>]
typedef EitherZodType = Either<String, ZodType>;

/// A ZodType is a type that can be validated.
abstract class ZodType {}
