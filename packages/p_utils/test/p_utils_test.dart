import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:p_models/models.dart';
import 'package:p_utils/p_utils.dart';

class MockDio extends Mock implements Dio {}

void main() {
  final mockDio = MockDio();
  group('SafeApiCall', () {
    test('Sprawdzanie connection timeout', () async {
      when(() => mockDio.get<dynamic>(any())).thenThrow(
        DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(),
        ),
      );
      await expectLater(
        () async => SafeApiCall.call(() async => mockDio.get<dynamic>('')),
        throwsA(isA<NetworkException>()),
      );
    });

    test('Sprawdzanie błedu bad response', () async {
      final badResponseJson = {
        'statusCode': 400,
        'errors': [
          {'field': 'string', 'message': 'string'},
        ],
      };
      when(() => mockDio.get<dynamic>(any())).thenThrow(
        DioException(
          response: Response(
            requestOptions: RequestOptions(),
            data: badResponseJson,
            statusCode: 400,
          ),
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(),
        ),
      );

      await expectLater(
        () async => SafeApiCall.call(() async => mockDio.get<dynamic>('')),
        throwsA(isA<BadResponseException>()),
      );
    });

    test('Debug BadResponse parsing', () async {
      final badResponseJson = {
        'statusCode': 400,
        'errors': [
          {'field': 'field', 'message': 'message'},
        ],
      };

      // Test parsowanie bezpośrednio
      try {
        final badResponse = BadResponse.fromJson(badResponseJson);
        expect(badResponse.statusCode, equals(400));
        expect(badResponse.errors.length, equals(1));
        expect(badResponse.errors.first.field, equals('field'));
        expect(badResponse.errors.first.message, equals('message'));
        debugPrint('Parsed BadResponse successfully: $badResponse');
      } catch (e) {
        fail('Parsowanie BadResponse nie powiodło się: $e');
      }
    });

    test('Debug BadResponse bad parsing', () async {
      final badResponseJson = {
        'statusCode': 'should be int', // Błędny typ
        'errors': [
          {'field': 'field', 'message': 'message'},
        ],
      };

      // Test parsowanie bezpośrednio
      when(() => mockDio.get<dynamic>(any())).thenThrow(
        DioException(
          response: Response(
            requestOptions: RequestOptions(),
            data: badResponseJson,
            statusCode: 400,
          ),
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(),
        ),
      );
      await expectLater(
        () async => SafeApiCall.call(() async => mockDio.get<dynamic>('')),
        throwsA(isA<JsonParseException>()),
      );
    });
    test('Debug BadResponse bad parsing', () async {
      const badResponseJson = {
        'statusCode',
        // Brak pola 'errors'
      };

      // Test parsowanie bezpośrednio
      when(() => mockDio.get<dynamic>(any())).thenThrow(
        DioException(
          response: Response(
            requestOptions: RequestOptions(),
            data: badResponseJson,
            statusCode: 400,
          ),
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(),
        ),
      );
      await expectLater(
        () async => SafeApiCall.call(() async => mockDio.get<dynamic>('')),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
