import 'package:fpdart/fpdart.dart';
import 'package:zod/zod.dart';

/// Type alias for [Either<String, ZodString>]
typedef EitherZodString = Either<String, ZodString>;

/// A ZodString is a ZodType that represents a string.
class ZodString extends ZodType {
  /// A ZodString is a ZodType that represents a string.
  ZodString(this.value);

  /// The value of the ZodString.
  final String? value;

  /// Validates the current ZodString.
  EitherZodString call() => right(this);
}

/// Extension methods to validate [String]
extension ZodStringValidationExtension on EitherZodString {
  /// If the length of the value passed in is greater than the minLength
  /// parameter or not.
  EitherZodString min(int minLength, {String? message}) {
    return flatMap(
      (a) => a.value != null && a.value!.length < minLength
          ? left(message ?? 'string.min.length')
          : right(a),
    );
  }

  /// If the length of the value passed in is less than the maxLength
  /// parameter or not.

  EitherZodString max(int maxLength, {String? message}) {
    return flatMap(
      (a) => a.value != null && a.value!.length > maxLength
          ? left(message ?? 'string.min.length')
          : right(a),
    );
  }

  /// If the length of the value passed in is equal to the length parameter or
  /// not.
  EitherZodString length(int length, {String? message}) {
    return flatMap(
      (a) => a.value != null && a.value!.length != length
          ? left(message ?? 'string.length')
          : right(a),
    );
  }

  /// If the value passed is a valid email address or not.
  EitherZodString email({String? message}) {
    return flatMap(
      (a) => a.value != null &&
              !RegExp(ValidationRegExp.email, caseSensitive: false)
                  .hasMatch(a.value!)
          ? left(message ?? 'string.email')
          : right(a),
    );
  }

  /// If the value passed is a valid URL or not.
  EitherZodString url({String? message}) {
    return flatMap(
      (a) => a.value != null
          ? IOEither.tryCatch(
              () {
                Uri.parse(a.value!);
                return a;
              },
              (_, __) => message ?? 'string.url',
            ).run()
          : right(a),
    );
  }

  /// If the value passed in is an uuid or not.
  EitherZodString uuid({String? message}) {
    return flatMap(
      (a) => a.value != null &&
              !RegExp(ValidationRegExp.uuid, caseSensitive: false)
                  .hasMatch(a.value!)
          ? right(a)
          : left(message ?? 'string.uuid'),
    );
  }

  /// If the value passed in is a valid nanoid or not.
  EitherZodString nanoid({String? message}) {
    return flatMap(
      (a) =>
          a.value != null && !RegExp(ValidationRegExp.nanoID).hasMatch(a.value!)
              ? right(a)
              : left(message ?? 'string.nanoid'),
    );
  }

  /// If the value passed in is a valid cuid or not.
  EitherZodString cuid({String? message}) {
    return flatMap(
      (a) =>
          a.value != null && !RegExp(ValidationRegExp.cuid).hasMatch(a.value!)
              ? right(a)
              : left(message ?? 'string.cuid'),
    );
  }

  /// If the value passed in is a valid cuid2 or not.
  EitherZodString cuid2({String? message}) {
    return flatMap(
      (a) =>
          a.value != null && !RegExp(ValidationRegExp.cuid2).hasMatch(a.value!)
              ? right(a)
              : left(message ?? 'string.cuid2'),
    );
  }

  /// If the value passed in is a valid ulid or not.
  EitherZodString ulid({String? message}) {
    return flatMap(
      (a) =>
          a.value != null && !RegExp(ValidationRegExp.ulid).hasMatch(a.value!)
              ? right(a)
              : left(message ?? 'string.ulid'),
    );
  }

  /// If the value passed in starts with the prefix or not.
  EitherZodString startsWith(String prefix, {String? message}) {
    return flatMap(
      (a) => a.value != null && !a.value!.startsWith(prefix)
          ? left(message ?? 'string.startsWith')
          : right(a),
    );
  }

  /// If the value passed in ends with the suffix or not.
  EitherZodString endsWith(String suffix, {String? message}) {
    return flatMap(
      (a) => a.value != null && !a.value!.endsWith(suffix)
          ? left(message ?? 'string.endsWith')
          : right(a),
    );
  }

  /// If the value passed in contains the substring or not.
  EitherZodString contains(String substring, {String? message}) {
    return flatMap(
      (a) => a.value != null && !a.value!.contains(substring)
          ? left(message ?? 'string.contains')
          : right(a),
    );
  }

  /// If the value passed in matches the pattern or not.
  EitherZodString regex(String pattern, {String? message}) {
    return flatMap(
      (a) => a.value != null && !RegExp(pattern).hasMatch(a.value!)
          ? left(message ?? 'string.matches')
          : right(a),
    );
  }

  /// If the value passed in is a valid IPv4 address or not.
  EitherZodString ipv4({String? message}) {
    return flatMap(
      (a) => a.value != null &&
              !RegExp(ValidationRegExp.ipv4, caseSensitive: false)
                  .hasMatch(a.value!)
          ? right(a)
          : left(message ?? 'string.ipv4'),
    );
  }

  /// If the value passed in is a valid IPv6 address or not.
  EitherZodString ipv6({String? message}) {
    return flatMap(
      (a) => a.value != null &&
              !RegExp(ValidationRegExp.ipv6, caseSensitive: false)
                  .hasMatch(a.value!)
          ? right(a)
          : left(message ?? 'string.ipv6'),
    );
  }

  /// If the value passed in is a valid base64 string or not.
  EitherZodString base64({String? message}) {
    return flatMap(
      (a) => a.value != null &&
              !RegExp(ValidationRegExp.base64, caseSensitive: false)
                  .hasMatch(a.value!)
          ? right(a)
          : left(message ?? 'string.base64'),
    );
  }

  /// If the value passed in is null or not.
  EitherZodString notNull({String? message}) {
    return flatMap(
      (a) => a.value != null ? right(a) : left(message ?? 'string.notNull'),
    );
  }
}

/// Validation regular expressions
class ValidationRegExp {
  /// Email validation regular expression
  static const email =
      r"^(?!\.)(?!.*\.\.)([A-Z0-9_'+\-\.]*)[A-Z0-9_+-]@([A-Z0-9][A-Z0-9\-]*\.)+[A-Z]{2,}$";

  /// UUID validation regular expression
  static const uuid =
      r'^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$';

  /// NanoID validation regular expression
  static const nanoID = r'^[a-z0-9_-]{21}$';

  /// CUID validation regular expression
  static const cuid = r'^c[^\s-]{8,}$';

  /// CUID2 validation regular expression
  static const cuid2 = r'^[0-9a-z]+$';

  /// ULID validation regular expression
  static const ulid = r'^[0-9A-HJKMNP-TV-Z]{26}$';

  /// IPV4 validation regular expression
  static const ipv4 =
      r'^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$';

  /// IPV6 validation regular expression
  static const ipv6 =
      r'^(([a-f0-9]{1,4}:){7}|::([a-f0-9]{1,4}:){0,6}|([a-f0-9]{1,4}:){1}:([a-f0-9]{1,4}:){0,5}|([a-f0-9]{1,4}:){2}:([a-f0-9]{1,4}:){0,4}|([a-f0-9]{1,4}:){3}:([a-f0-9]{1,4}:){0,3}|([a-f0-9]{1,4}:){4}:([a-f0-9]{1,4}:){0,2}|([a-f0-9]{1,4}:){5}:([a-f0-9]{1,4}:){0,1})([a-f0-9]{1,4}|(((25[0-5])|(2[0-4][0-9])|(1[0-9]{2})|([0-9]{1,2}))\.){3}((25[0-5])|(2[0-4][0-9])|(1[0-9]{2})|([0-9]{1,2})))$';

  /// Base64 validation regular expression
  static const base64 =
      r'^([0-9a-zA-Z+/]{4})*(([0-9a-zA-Z+/]{2}==)|([0-9a-zA-Z+/]{3}=))?$';
}
