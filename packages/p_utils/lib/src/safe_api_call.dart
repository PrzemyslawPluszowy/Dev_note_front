import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:p_models/models.dart';

/// Klasa narzędziowa do bezpiecznego wykonywania wywołań API z kompleksową obsługą błędów.
///
/// Opakowuje wywołania API i konwertuje różne wyjątki na typowane [ApiException]
/// dla spójnej obsługi błędów w całej aplikacji.
class SafeApiCall {
  SafeApiCall._();

  /// Wykonuje przekazaną funkcję [apiCall] w sposób bezpieczny, obsługując wyjątki.
  /// Konwertuje wyjątki Dio na konkretne typy [ApiException].
  /// Rzuca [NetworkException], [BadResponseException], [ServerException],
  /// [JsonParseException] lub [UnknownException] w zależności od napotkanego błędu.
  ///   - [NetworkException] dla błędów związanych z siecią
  ///   - [BadResponseException] dla nieprawidłowych odpowiedzi z serwera
  ///   - [ServerException] dla błędów po stronie serwera
  ///   - [JsonParseException] dla błędów parsowania JSON
  ///   - [UnknownException] dla wszelkich innych błędów
  static Future<T> call<T>(Future<T> Function() apiCall) async {
    try {
      return await apiCall();
    } on DioException catch (e, s) {
      _logError('Dio exception: $e\nStack trace: $s');

      if (_isNetworkError(e.type)) {
        throw const NetworkException();
      } else if (e.type == DioExceptionType.badResponse) {
        throw _handleBadResponse(e);
      } else if (e.type == DioExceptionType.unknown) {
        throw const ServerException();
      } else {
        throw const UnknownException();
      }
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      _logError('Unknown exception', e);
      throw const UnknownException();
    }
  }

  static void _logError(String message, [dynamic data]) {
    debugPrint('SafeApiCall: $message${data != null ? ' - $data' : ''}');
  }

  static ApiException _handleBadResponse(DioException e) {
    if (e.response?.data == null || e.response?.data is! Map<String, dynamic>) {
      return const ServerException();
    }

    _logError('Response data', e.response!.data);
    _logError('Response type', e.response!.data.runtimeType.toString());

    try {
      _logError('Attempting to parse BadResponse', e.response!.data);
      final badResponse = BadResponse.fromJson(
        e.response!.data as Map<String, dynamic>,
      );
      _logError('Parsed BadResponse successfully', badResponse);

      final errors = badResponse.errors
          .map((error) => '${error.field}: ${error.message}')
          .toList();
      return BadResponseException(errors: errors);
    } on FormatException catch (error, stackTrace) {
      _logError('Failed to parse BadResponse', '$error\n$stackTrace');
      return const JsonParseException();
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      _logError('Unexpected error parsing BadResponse', e);
      return const JsonParseException();
    }
  }

  static bool _isNetworkError(DioExceptionType type) {
    return type == DioExceptionType.connectionTimeout ||
        type == DioExceptionType.receiveTimeout ||
        type == DioExceptionType.sendTimeout ||
        type == DioExceptionType.badCertificate ||
        type == DioExceptionType.connectionError;
  }
}

/// Bazowa klasa dla wszystkich wyjątków związanych z API.
abstract class ApiException implements Exception {
  const ApiException();
}

/// Rzucany w przypadku problemów z łącznością sieciową.
class NetworkException extends ApiException {
  const NetworkException();
}

/// Rzucany w przypadku nieznanego lub nieoczekiwanego błędu.
class UnknownException extends ApiException {
  const UnknownException();
}

/// Rzucany, gdy serwer zwraca nieprawidłową odpowiedź z błędami walidacji.
class BadResponseException extends ApiException {
  const BadResponseException({
    required this.errors,
  });

  final List<String> errors;

  @override
  String toString() => errors.join('\n');
}

/// Rzucany w przypadku błędu serwera (kody statusu 5xx).
class ServerException extends ApiException {
  const ServerException();
}

/// Rzucany, gdy parsowanie JSON kończy się niepowodzeniem.
class JsonParseException extends ApiException {
  const JsonParseException();
}
