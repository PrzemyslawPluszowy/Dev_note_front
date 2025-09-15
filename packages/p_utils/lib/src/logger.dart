import 'package:talker/talker.dart';

/// Logger uzywany w aplikacji
/// Inicjalizacja musi byc wykonana przed uzyciem loggera
/// Przykład inicjalizacji:
/// ```dart
/// Logger.initialize(null);
/// ```

final class Logger {
  // Statyczne pole do przechowywania konfiguracji
  static TalkerLoggerSettings? _settings;

  // Statyczna instancja TalkerLogger
  static late final TalkerLogger _logger;

  /// Metoda do inicjalizacji loggera
  static void initialize(TalkerLoggerSettings? settings) {
    _settings = settings;
    _logger = TalkerLogger(
      settings:
          _settings ??
          TalkerLoggerSettings(
            colors: {
              LogLevel.error: (AnsiPen()..red()),
              LogLevel.info: (AnsiPen()..green()),
              LogLevel.warning: (AnsiPen()..yellow()),
              LogLevel.debug: (AnsiPen()..white()),
              LogLevel.critical: (AnsiPen()..red(bg: true, bold: true)),
            },
          ),
    );
  }

  /// Logowanie błędów
  static void error(String msg, {Object? err, StackTrace? stackTrace}) {
    if (err != null || stackTrace != null) {
      _logger.error(
        '$msg,\n error: ${err ?? 'Brak błędu'} \n\n  stackTrace: ${stackTrace ?? 'Brak StackTrace'}',
      );
      return;
    }
    _logger.error(
      '$msg,\n error: ${err ?? 'Brak błędu'} \n\n  stackTrace: ${stackTrace ?? 'Brak StackTrace'}',
    );
  }

  /// Logowanie informacji
  static void info(String msg, {Object? err, StackTrace? stackTrace}) {
    if (err != null || stackTrace != null) {
      _logger.info(
        '$msg, \n\n  error: ${err ?? 'Brak błędu'} \n\n  stackTrace: ${stackTrace ?? 'Brak StackTrace'}',
      );
      return;
    } else {
      _logger.info(msg);
    }
  }

  /// Logowanie ostrzeżeń
  static void warning(String msg, {Object? err, StackTrace? stackTrace}) {
    if (err != null || stackTrace != null) {
      _logger.warning(
        '$msg, \n\n  error: ${err ?? 'Brak błędu'} \n\n  stackTrace: ${stackTrace ?? 'Brak StackTrace'}',
      );
      return;
    }
    _logger.warning(
      msg,
    );
  }

  /// Logowanie debugowe
  static void debug(String msg, {Object? err, StackTrace? stackTrace}) {
    if (err != null || stackTrace != null) {
      _logger.debug(
        '$msg, \n\n  error: ${err ?? 'Brak błędu'} \n\n  stackTrace: ${stackTrace ?? 'Brak StackTrace'}',
      );
    } else {
      _logger.debug(msg);
    }
  }
}
