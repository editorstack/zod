import 'package:collection/collection.dart';
import 'package:fpdart/fpdart.dart';
import 'package:zod/zod.dart';

/// Type alias for [Either<String, ZodList<T>>]
typedef EitherZodList<T> = Either<String, ZodList<T>>;

/// A ZodList is a ZodType that represents a List.
class ZodList<T> extends ZodType {
  /// A ZodList is a ZodType that represents a Int.
  ZodList(this.value, {this.elements});

  /// The value of the ZodInt.
  final List<T>? value;

  /// The element validation type
  final EitherZodType Function(T element)? elements;

  /// Validates the current ZodList.
  EitherZodList<T> call() => value != null && elements != null
      ? value!
              .map((e) => elements!(e))
              .firstWhereOrNull((e) => e.isLeft())
              ?.map((_) => this) ??
          right(this)
      : right(this);
}

/// Extension methods to validate [List]
extension ZodListValidationExtension<T> on EitherZodList<T> {
  /// If the list passed in has min items or not.
  EitherZodList<T> min(int min, {String? message}) {
    return flatMap(
      (a) => a.value != null && a.value!.length < min
          ? left(message ?? 'list.min')
          : right(a),
    );
  }

  /// If the list passed in has max items or not.
  EitherZodList<T> max(int max, {String? message}) {
    return flatMap(
      (a) => a.value != null && a.value!.length > max
          ? left(message ?? 'list.max')
          : right(a),
    );
  }

  /// If the list passed in has exact number of items or not.
  EitherZodList<T> exactLength(int length, {String? message}) {
    return flatMap(
      (a) => a.value != null && a.value!.length != length
          ? left(message ?? 'list.length')
          : right(a),
    );
  }

  /// If the value passed in is null or not.
  EitherZodList<T> notNull({String? message}) {
    return flatMap(
      (a) => a.value == null ? left(message ?? 'list.notNull') : right(a),
    );
  }
}
