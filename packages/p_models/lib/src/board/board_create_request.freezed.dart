// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_create_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoardCreateRequest {

 String get name; String? get description; String get projectId; String get workspaceId;
/// Create a copy of BoardCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardCreateRequestCopyWith<BoardCreateRequest> get copyWith => _$BoardCreateRequestCopyWithImpl<BoardCreateRequest>(this as BoardCreateRequest, _$identity);

  /// Serializes this BoardCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardCreateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,projectId,workspaceId);

@override
String toString() {
  return 'BoardCreateRequest(name: $name, description: $description, projectId: $projectId, workspaceId: $workspaceId)';
}


}

/// @nodoc
abstract mixin class $BoardCreateRequestCopyWith<$Res>  {
  factory $BoardCreateRequestCopyWith(BoardCreateRequest value, $Res Function(BoardCreateRequest) _then) = _$BoardCreateRequestCopyWithImpl;
@useResult
$Res call({
 String name, String? description, String projectId, String workspaceId
});




}
/// @nodoc
class _$BoardCreateRequestCopyWithImpl<$Res>
    implements $BoardCreateRequestCopyWith<$Res> {
  _$BoardCreateRequestCopyWithImpl(this._self, this._then);

  final BoardCreateRequest _self;
  final $Res Function(BoardCreateRequest) _then;

/// Create a copy of BoardCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? projectId = null,Object? workspaceId = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardCreateRequest].
extension BoardCreateRequestPatterns on BoardCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _BoardCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BoardCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description,  String projectId,  String workspaceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardCreateRequest() when $default != null:
return $default(_that.name,_that.description,_that.projectId,_that.workspaceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description,  String projectId,  String workspaceId)  $default,) {final _that = this;
switch (_that) {
case _BoardCreateRequest():
return $default(_that.name,_that.description,_that.projectId,_that.workspaceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description,  String projectId,  String workspaceId)?  $default,) {final _that = this;
switch (_that) {
case _BoardCreateRequest() when $default != null:
return $default(_that.name,_that.description,_that.projectId,_that.workspaceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoardCreateRequest extends BoardCreateRequest {
  const _BoardCreateRequest({required this.name, this.description, required this.projectId, required this.workspaceId}): super._();
  factory _BoardCreateRequest.fromJson(Map<String, dynamic> json) => _$BoardCreateRequestFromJson(json);

@override final  String name;
@override final  String? description;
@override final  String projectId;
@override final  String workspaceId;

/// Create a copy of BoardCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardCreateRequestCopyWith<_BoardCreateRequest> get copyWith => __$BoardCreateRequestCopyWithImpl<_BoardCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardCreateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,projectId,workspaceId);

@override
String toString() {
  return 'BoardCreateRequest(name: $name, description: $description, projectId: $projectId, workspaceId: $workspaceId)';
}


}

/// @nodoc
abstract mixin class _$BoardCreateRequestCopyWith<$Res> implements $BoardCreateRequestCopyWith<$Res> {
  factory _$BoardCreateRequestCopyWith(_BoardCreateRequest value, $Res Function(_BoardCreateRequest) _then) = __$BoardCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description, String projectId, String workspaceId
});




}
/// @nodoc
class __$BoardCreateRequestCopyWithImpl<$Res>
    implements _$BoardCreateRequestCopyWith<$Res> {
  __$BoardCreateRequestCopyWithImpl(this._self, this._then);

  final _BoardCreateRequest _self;
  final $Res Function(_BoardCreateRequest) _then;

/// Create a copy of BoardCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? projectId = null,Object? workspaceId = null,}) {
  return _then(_BoardCreateRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
