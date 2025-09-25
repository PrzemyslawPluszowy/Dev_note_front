import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum ApiColorScheme {
  primary,
  red,
  pink,
  purple,
  deepPurple,
  indigo,
  blue,
  lightBlue,
  cyan,
  teal,
  green,
  lightGreen,
  lime,
  yellow,
  amber,
  orange,
  deepOrange,
  brown,
  grey,
  blueGrey,
  black,
  white;

  // Mapowanie wartości enum na odpowiadające im kody kolorów w formacie hex
  static const Map<ApiColorScheme, String> _colorHexMap = {
    ApiColorScheme.primary: '#1565C0',
    ApiColorScheme.red: '#FF0000',
    ApiColorScheme.pink: '#FFC0CB',
    ApiColorScheme.purple: '#800080',
    ApiColorScheme.deepPurple: '#673AB7',
    ApiColorScheme.indigo: '#3F51B5',
    ApiColorScheme.blue: '#0000FF',
    ApiColorScheme.lightBlue: '#ADD8E6',
    ApiColorScheme.cyan: '#00FFFF',
    ApiColorScheme.teal: '#008080',
    ApiColorScheme.green: '#008000',
    ApiColorScheme.lightGreen: '#90EE90',
    ApiColorScheme.lime: '#00FF00',
    ApiColorScheme.yellow: '#FFFF00',
    ApiColorScheme.amber: '#FFBF00',
    ApiColorScheme.orange: '#FFA500',
    ApiColorScheme.deepOrange: '#FF4500',
    ApiColorScheme.brown: '#A52A2A',
    ApiColorScheme.grey: '#808080',
    ApiColorScheme.blueGrey: '#607D8B',
    ApiColorScheme.black: '#000000',
    ApiColorScheme.white: '#FFFFFF',
  };

  // Konwertuj enum na kod hex
  String toHex() => _colorHexMap[this] ?? '#000000';

  // Utwórz enum na podstawie kodu hex
  static ApiColorScheme? fromHex(String hex) {
    return _colorHexMap.entries
        .firstWhere(
          (entry) => entry.value.toLowerCase() == hex.toLowerCase(),
          orElse: () => const MapEntry(ApiColorScheme.primary, '#1565C0'),
        )
        .key;
  }

  // wszytkie kolory w formie listy
  List<ApiColorScheme> get allColors => ApiColorScheme.values;

  // Serializacja do JSON
  String toJson() => toHex();

  // Deserializacja z JSON
  static ApiColorScheme? fromJson(String json) => fromHex(json);

  // Konwertuj kod hex na obiekt Color
  Color toFlutterColor() {
    final hex = toHex().replaceAll('#', '');
    return Color(
      int.parse('FF$hex', radix: 16),
    ); // Dodanie pełnej przezroczystości
  }
}

class ApiColorSchemeSerializer
    implements JsonConverter<ApiColorScheme, String?> {
  const ApiColorSchemeSerializer();

  @override
  ApiColorScheme fromJson(String? json) {
    if (json == null || json.isEmpty) return ApiColorScheme.blueGrey;
    // Deserializacja z JSON
    return ApiColorScheme.fromJson(json) ?? ApiColorScheme.blueGrey;
  }

  @override
  String? toJson(ApiColorScheme? object) {
    // Serializacja do JSON
    return object?.toHex();
  }
}
