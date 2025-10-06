// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoardFullModel {

 String get id; String get name; String? get description; String get projectId; DateTime get createdAt; DateTime? get updatedAt; List<FieldDefinition> get fieldDefinitions;
/// Create a copy of BoardFullModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardFullModelCopyWith<BoardFullModel> get copyWith => _$BoardFullModelCopyWithImpl<BoardFullModel>(this as BoardFullModel, _$identity);

  /// Serializes this BoardFullModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardFullModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.fieldDefinitions, fieldDefinitions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,projectId,createdAt,updatedAt,const DeepCollectionEquality().hash(fieldDefinitions));

@override
String toString() {
  return 'BoardFullModel(id: $id, name: $name, description: $description, projectId: $projectId, createdAt: $createdAt, updatedAt: $updatedAt, fieldDefinitions: $fieldDefinitions)';
}


}

/// @nodoc
abstract mixin class $BoardFullModelCopyWith<$Res>  {
  factory $BoardFullModelCopyWith(BoardFullModel value, $Res Function(BoardFullModel) _then) = _$BoardFullModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String projectId, DateTime createdAt, DateTime? updatedAt, List<FieldDefinition> fieldDefinitions
});




}
/// @nodoc
class _$BoardFullModelCopyWithImpl<$Res>
    implements $BoardFullModelCopyWith<$Res> {
  _$BoardFullModelCopyWithImpl(this._self, this._then);

  final BoardFullModel _self;
  final $Res Function(BoardFullModel) _then;

/// Create a copy of BoardFullModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? projectId = null,Object? createdAt = null,Object? updatedAt = freezed,Object? fieldDefinitions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fieldDefinitions: null == fieldDefinitions ? _self.fieldDefinitions : fieldDefinitions // ignore: cast_nullable_to_non_nullable
as List<FieldDefinition>,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardFullModel].
extension BoardFullModelPatterns on BoardFullModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardFullModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardFullModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardFullModel value)  $default,){
final _that = this;
switch (_that) {
case _BoardFullModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardFullModel value)?  $default,){
final _that = this;
switch (_that) {
case _BoardFullModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String projectId,  DateTime createdAt,  DateTime? updatedAt,  List<FieldDefinition> fieldDefinitions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardFullModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.projectId,_that.createdAt,_that.updatedAt,_that.fieldDefinitions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String projectId,  DateTime createdAt,  DateTime? updatedAt,  List<FieldDefinition> fieldDefinitions)  $default,) {final _that = this;
switch (_that) {
case _BoardFullModel():
return $default(_that.id,_that.name,_that.description,_that.projectId,_that.createdAt,_that.updatedAt,_that.fieldDefinitions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String projectId,  DateTime createdAt,  DateTime? updatedAt,  List<FieldDefinition> fieldDefinitions)?  $default,) {final _that = this;
switch (_that) {
case _BoardFullModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.projectId,_that.createdAt,_that.updatedAt,_that.fieldDefinitions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoardFullModel implements BoardFullModel {
  const _BoardFullModel({required this.id, required this.name, this.description, required this.projectId, required this.createdAt, this.updatedAt, final  List<FieldDefinition> fieldDefinitions = const []}): _fieldDefinitions = fieldDefinitions;
  factory _BoardFullModel.fromJson(Map<String, dynamic> json) => _$BoardFullModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String projectId;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
 final  List<FieldDefinition> _fieldDefinitions;
@override@JsonKey() List<FieldDefinition> get fieldDefinitions {
  if (_fieldDefinitions is EqualUnmodifiableListView) return _fieldDefinitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fieldDefinitions);
}


/// Create a copy of BoardFullModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardFullModelCopyWith<_BoardFullModel> get copyWith => __$BoardFullModelCopyWithImpl<_BoardFullModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardFullModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardFullModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._fieldDefinitions, _fieldDefinitions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,projectId,createdAt,updatedAt,const DeepCollectionEquality().hash(_fieldDefinitions));

@override
String toString() {
  return 'BoardFullModel(id: $id, name: $name, description: $description, projectId: $projectId, createdAt: $createdAt, updatedAt: $updatedAt, fieldDefinitions: $fieldDefinitions)';
}


}

/// @nodoc
abstract mixin class _$BoardFullModelCopyWith<$Res> implements $BoardFullModelCopyWith<$Res> {
  factory _$BoardFullModelCopyWith(_BoardFullModel value, $Res Function(_BoardFullModel) _then) = __$BoardFullModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String projectId, DateTime createdAt, DateTime? updatedAt, List<FieldDefinition> fieldDefinitions
});




}
/// @nodoc
class __$BoardFullModelCopyWithImpl<$Res>
    implements _$BoardFullModelCopyWith<$Res> {
  __$BoardFullModelCopyWithImpl(this._self, this._then);

  final _BoardFullModel _self;
  final $Res Function(_BoardFullModel) _then;

/// Create a copy of BoardFullModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? projectId = null,Object? createdAt = null,Object? updatedAt = freezed,Object? fieldDefinitions = null,}) {
  return _then(_BoardFullModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fieldDefinitions: null == fieldDefinitions ? _self._fieldDefinitions : fieldDefinitions // ignore: cast_nullable_to_non_nullable
as List<FieldDefinition>,
  ));
}


}


/// @nodoc
mixin _$FieldDefinition {

 String get id; String get name; String get displayName;@FieldTypeConverter() FieldType get type; List<String>? get options; String? get defaultValue; bool get isRequired; bool get isVisible; int get order; int? get width; DateTime get createdAt; String get boardId; String? get createdById; String? get createdByName; String? get assignedToId; String? get assignedToName; List<String>? get observedBy;
/// Create a copy of FieldDefinition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FieldDefinitionCopyWith<FieldDefinition> get copyWith => _$FieldDefinitionCopyWithImpl<FieldDefinition>(this as FieldDefinition, _$identity);

  /// Serializes this FieldDefinition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FieldDefinition&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.order, order) || other.order == order)&&(identical(other.width, width) || other.width == width)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.createdById, createdById) || other.createdById == createdById)&&(identical(other.createdByName, createdByName) || other.createdByName == createdByName)&&(identical(other.assignedToId, assignedToId) || other.assignedToId == assignedToId)&&(identical(other.assignedToName, assignedToName) || other.assignedToName == assignedToName)&&const DeepCollectionEquality().equals(other.observedBy, observedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,displayName,type,const DeepCollectionEquality().hash(options),defaultValue,isRequired,isVisible,order,width,createdAt,boardId,createdById,createdByName,assignedToId,assignedToName,const DeepCollectionEquality().hash(observedBy));

@override
String toString() {
  return 'FieldDefinition(id: $id, name: $name, displayName: $displayName, type: $type, options: $options, defaultValue: $defaultValue, isRequired: $isRequired, isVisible: $isVisible, order: $order, width: $width, createdAt: $createdAt, boardId: $boardId, createdById: $createdById, createdByName: $createdByName, assignedToId: $assignedToId, assignedToName: $assignedToName, observedBy: $observedBy)';
}


}

/// @nodoc
abstract mixin class $FieldDefinitionCopyWith<$Res>  {
  factory $FieldDefinitionCopyWith(FieldDefinition value, $Res Function(FieldDefinition) _then) = _$FieldDefinitionCopyWithImpl;
@useResult
$Res call({
 String id, String name, String displayName,@FieldTypeConverter() FieldType type, List<String>? options, String? defaultValue, bool isRequired, bool isVisible, int order, int? width, DateTime createdAt, String boardId, String? createdById, String? createdByName, String? assignedToId, String? assignedToName, List<String>? observedBy
});




}
/// @nodoc
class _$FieldDefinitionCopyWithImpl<$Res>
    implements $FieldDefinitionCopyWith<$Res> {
  _$FieldDefinitionCopyWithImpl(this._self, this._then);

  final FieldDefinition _self;
  final $Res Function(FieldDefinition) _then;

/// Create a copy of FieldDefinition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? displayName = null,Object? type = null,Object? options = freezed,Object? defaultValue = freezed,Object? isRequired = null,Object? isVisible = null,Object? order = null,Object? width = freezed,Object? createdAt = null,Object? boardId = null,Object? createdById = freezed,Object? createdByName = freezed,Object? assignedToId = freezed,Object? assignedToName = freezed,Object? observedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FieldType,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>?,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as String,createdById: freezed == createdById ? _self.createdById : createdById // ignore: cast_nullable_to_non_nullable
as String?,createdByName: freezed == createdByName ? _self.createdByName : createdByName // ignore: cast_nullable_to_non_nullable
as String?,assignedToId: freezed == assignedToId ? _self.assignedToId : assignedToId // ignore: cast_nullable_to_non_nullable
as String?,assignedToName: freezed == assignedToName ? _self.assignedToName : assignedToName // ignore: cast_nullable_to_non_nullable
as String?,observedBy: freezed == observedBy ? _self.observedBy : observedBy // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [FieldDefinition].
extension FieldDefinitionPatterns on FieldDefinition {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FieldDefinition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FieldDefinition() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FieldDefinition value)  $default,){
final _that = this;
switch (_that) {
case _FieldDefinition():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FieldDefinition value)?  $default,){
final _that = this;
switch (_that) {
case _FieldDefinition() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String displayName, @FieldTypeConverter()  FieldType type,  List<String>? options,  String? defaultValue,  bool isRequired,  bool isVisible,  int order,  int? width,  DateTime createdAt,  String boardId,  String? createdById,  String? createdByName,  String? assignedToId,  String? assignedToName,  List<String>? observedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FieldDefinition() when $default != null:
return $default(_that.id,_that.name,_that.displayName,_that.type,_that.options,_that.defaultValue,_that.isRequired,_that.isVisible,_that.order,_that.width,_that.createdAt,_that.boardId,_that.createdById,_that.createdByName,_that.assignedToId,_that.assignedToName,_that.observedBy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String displayName, @FieldTypeConverter()  FieldType type,  List<String>? options,  String? defaultValue,  bool isRequired,  bool isVisible,  int order,  int? width,  DateTime createdAt,  String boardId,  String? createdById,  String? createdByName,  String? assignedToId,  String? assignedToName,  List<String>? observedBy)  $default,) {final _that = this;
switch (_that) {
case _FieldDefinition():
return $default(_that.id,_that.name,_that.displayName,_that.type,_that.options,_that.defaultValue,_that.isRequired,_that.isVisible,_that.order,_that.width,_that.createdAt,_that.boardId,_that.createdById,_that.createdByName,_that.assignedToId,_that.assignedToName,_that.observedBy);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String displayName, @FieldTypeConverter()  FieldType type,  List<String>? options,  String? defaultValue,  bool isRequired,  bool isVisible,  int order,  int? width,  DateTime createdAt,  String boardId,  String? createdById,  String? createdByName,  String? assignedToId,  String? assignedToName,  List<String>? observedBy)?  $default,) {final _that = this;
switch (_that) {
case _FieldDefinition() when $default != null:
return $default(_that.id,_that.name,_that.displayName,_that.type,_that.options,_that.defaultValue,_that.isRequired,_that.isVisible,_that.order,_that.width,_that.createdAt,_that.boardId,_that.createdById,_that.createdByName,_that.assignedToId,_that.assignedToName,_that.observedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FieldDefinition implements FieldDefinition {
  const _FieldDefinition({required this.id, required this.name, required this.displayName, @FieldTypeConverter() required this.type, final  List<String>? options, this.defaultValue, required this.isRequired, required this.isVisible, required this.order, this.width, required this.createdAt, required this.boardId, this.createdById, this.createdByName, this.assignedToId, this.assignedToName, final  List<String>? observedBy}): _options = options,_observedBy = observedBy;
  factory _FieldDefinition.fromJson(Map<String, dynamic> json) => _$FieldDefinitionFromJson(json);

@override final  String id;
@override final  String name;
@override final  String displayName;
@override@FieldTypeConverter() final  FieldType type;
 final  List<String>? _options;
@override List<String>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? defaultValue;
@override final  bool isRequired;
@override final  bool isVisible;
@override final  int order;
@override final  int? width;
@override final  DateTime createdAt;
@override final  String boardId;
@override final  String? createdById;
@override final  String? createdByName;
@override final  String? assignedToId;
@override final  String? assignedToName;
 final  List<String>? _observedBy;
@override List<String>? get observedBy {
  final value = _observedBy;
  if (value == null) return null;
  if (_observedBy is EqualUnmodifiableListView) return _observedBy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of FieldDefinition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FieldDefinitionCopyWith<_FieldDefinition> get copyWith => __$FieldDefinitionCopyWithImpl<_FieldDefinition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FieldDefinitionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FieldDefinition&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.order, order) || other.order == order)&&(identical(other.width, width) || other.width == width)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.createdById, createdById) || other.createdById == createdById)&&(identical(other.createdByName, createdByName) || other.createdByName == createdByName)&&(identical(other.assignedToId, assignedToId) || other.assignedToId == assignedToId)&&(identical(other.assignedToName, assignedToName) || other.assignedToName == assignedToName)&&const DeepCollectionEquality().equals(other._observedBy, _observedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,displayName,type,const DeepCollectionEquality().hash(_options),defaultValue,isRequired,isVisible,order,width,createdAt,boardId,createdById,createdByName,assignedToId,assignedToName,const DeepCollectionEquality().hash(_observedBy));

@override
String toString() {
  return 'FieldDefinition(id: $id, name: $name, displayName: $displayName, type: $type, options: $options, defaultValue: $defaultValue, isRequired: $isRequired, isVisible: $isVisible, order: $order, width: $width, createdAt: $createdAt, boardId: $boardId, createdById: $createdById, createdByName: $createdByName, assignedToId: $assignedToId, assignedToName: $assignedToName, observedBy: $observedBy)';
}


}

/// @nodoc
abstract mixin class _$FieldDefinitionCopyWith<$Res> implements $FieldDefinitionCopyWith<$Res> {
  factory _$FieldDefinitionCopyWith(_FieldDefinition value, $Res Function(_FieldDefinition) _then) = __$FieldDefinitionCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String displayName,@FieldTypeConverter() FieldType type, List<String>? options, String? defaultValue, bool isRequired, bool isVisible, int order, int? width, DateTime createdAt, String boardId, String? createdById, String? createdByName, String? assignedToId, String? assignedToName, List<String>? observedBy
});




}
/// @nodoc
class __$FieldDefinitionCopyWithImpl<$Res>
    implements _$FieldDefinitionCopyWith<$Res> {
  __$FieldDefinitionCopyWithImpl(this._self, this._then);

  final _FieldDefinition _self;
  final $Res Function(_FieldDefinition) _then;

/// Create a copy of FieldDefinition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? displayName = null,Object? type = null,Object? options = freezed,Object? defaultValue = freezed,Object? isRequired = null,Object? isVisible = null,Object? order = null,Object? width = freezed,Object? createdAt = null,Object? boardId = null,Object? createdById = freezed,Object? createdByName = freezed,Object? assignedToId = freezed,Object? assignedToName = freezed,Object? observedBy = freezed,}) {
  return _then(_FieldDefinition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FieldType,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>?,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as String,createdById: freezed == createdById ? _self.createdById : createdById // ignore: cast_nullable_to_non_nullable
as String?,createdByName: freezed == createdByName ? _self.createdByName : createdByName // ignore: cast_nullable_to_non_nullable
as String?,assignedToId: freezed == assignedToId ? _self.assignedToId : assignedToId // ignore: cast_nullable_to_non_nullable
as String?,assignedToName: freezed == assignedToName ? _self.assignedToName : assignedToName // ignore: cast_nullable_to_non_nullable
as String?,observedBy: freezed == observedBy ? _self._observedBy : observedBy // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
