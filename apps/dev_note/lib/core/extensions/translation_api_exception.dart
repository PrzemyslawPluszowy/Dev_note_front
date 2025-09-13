import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:p_utils/p_utils.dart';

/// Prosty entension do tłumaczenia wyjątków API
/// Przykład użycia:
/// ```dart
/// try {
///   await someApiCall();
/// } catch (e) {
///   print(e.translateMsg); // lub e.message
/// }

extension TranslationApiExtension on Exception {
  /// Zwraca przetłumaczony komunikat błędu, jeśli wyjątek jest typu ApiException.
  /// W przeciwnym razie ponownie rzuca wyjątek.
  String get message {
    // Rzuca wyjątek, jeśli nie jest typu ApiException
    if (this is ApiException) {
      return (this as ApiException).translateMsg;
    } else {
      throw this;
    }
  }

  /// Zwraca przetłumaczony komunikat błędu na podstawie typu ApiException.
  String get translateMsg {
    if (this is NetworkException) {
      return LocaleKeys.errors_networkError.tr();
    } else if (this is BadResponseException) {
      return (this as BadResponseException).errors.join('\n');
    } else if (this is ServerException) {
      return LocaleKeys.errors_serverError.tr();
    } else if (this is JsonParseException) {
      return LocaleKeys.errors_jsonParseError.tr();
    } else {
      return LocaleKeys.errors_unknownError.tr();
    }
  }
}
