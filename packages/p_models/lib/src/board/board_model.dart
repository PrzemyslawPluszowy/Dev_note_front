import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_model.freezed.dart';
part 'board_model.g.dart';

@freezed
abstract class BoardFullModel with _$BoardFullModel {
  const factory BoardFullModel({
    required String id,
    required String name,
    String? description,
    required String projectId,
    required DateTime createdAt,
    DateTime? updatedAt,
    @Default([]) List<FieldDefinition> fieldDefinitions,
  }) = _BoardFullModel;

  factory BoardFullModel.fromJson(Map<String, dynamic> json) =>
      _$BoardFullModelFromJson(json);
}

@freezed
abstract class FieldDefinition with _$FieldDefinition {
  const factory FieldDefinition({
    required String id,
    required String name,
    required String displayName,
    @FieldTypeConverter() required FieldType type,
    List<String>? options,
    String? defaultValue,
    required bool isRequired,
    required bool isVisible,
    required int order,
    int? width,
    required DateTime createdAt,
    required String boardId,
    String? createdById,
    String? createdByName,
    String? assignedToId,
    String? assignedToName,
    List<String>? observedBy,
  }) = _FieldDefinition;

  factory FieldDefinition.fromJson(Map<String, dynamic> json) =>
      _$FieldDefinitionFromJson(json);
}

enum FieldType {
  text,
  number,
  dropdown,
  date,
  dateTime,
  user,
  boolean,
  email,
  url,
  color,
}

class FieldTypeConverter implements JsonConverter<FieldType, int> {
  const FieldTypeConverter();

  @override
  FieldType fromJson(int json) {
    switch (json) {
      case 0:
        return FieldType.text;
      case 1:
        return FieldType.number;
      case 2:
        return FieldType.dropdown;
      case 3:
        return FieldType.date;
      case 4:
        return FieldType.dateTime;
      case 5:
        return FieldType.user;
      case 6:
        return FieldType.boolean;
      case 7:
        return FieldType.email;
      case 8:
        return FieldType.url;
      case 9:
        return FieldType.color;
      default:
        throw ArgumentError('Invalid field type value: $json');
    }
  }

  @override
  int toJson(FieldType object) {
    switch (object) {
      case FieldType.text:
        return 0;
      case FieldType.number:
        return 1;
      case FieldType.dropdown:
        return 2;
      case FieldType.date:
        return 3;
      case FieldType.dateTime:
        return 4;
      case FieldType.user:
        return 5;
      case FieldType.boolean:
        return 6;
      case FieldType.email:
        return 7;
      case FieldType.url:
        return 8;
      case FieldType.color:
        return 9;
    }
  }
}
