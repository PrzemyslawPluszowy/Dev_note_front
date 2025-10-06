// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_iteam_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkItemCreate {

 String get title; String get boardId; String get categoryId; String? get parentWorkItemId;
/// Create a copy of WorkItemCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkItemCreateCopyWith<WorkItemCreate> get copyWith => _$WorkItemCreateCopyWithImpl<WorkItemCreate>(this as WorkItemCreate, _$identity);

  /// Serializes this WorkItemCreate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkItemCreate&&(identical(other.title, title) || other.title == title)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.parentWorkItemId, parentWorkItemId) || other.parentWorkItemId == parentWorkItemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,boardId,categoryId,parentWorkItemId);

@override
String toString() {
  return 'WorkItemCreate(title: $title, boardId: $boardId, categoryId: $categoryId, parentWorkItemId: $parentWorkItemId)';
}


}

/// @nodoc
abstract mixin class $WorkItemCreateCopyWith<$Res>  {
  factory $WorkItemCreateCopyWith(WorkItemCreate value, $Res Function(WorkItemCreate) _then) = _$WorkItemCreateCopyWithImpl;
@useResult
$Res call({
 String title, String boardId, String categoryId, String? parentWorkItemId
});




}
/// @nodoc
class _$WorkItemCreateCopyWithImpl<$Res>
    implements $WorkItemCreateCopyWith<$Res> {
  _$WorkItemCreateCopyWithImpl(this._self, this._then);

  final WorkItemCreate _self;
  final $Res Function(WorkItemCreate) _then;

/// Create a copy of WorkItemCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? boardId = null,Object? categoryId = null,Object? parentWorkItemId = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,parentWorkItemId: freezed == parentWorkItemId ? _self.parentWorkItemId : parentWorkItemId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkItemCreate].
extension WorkItemCreatePatterns on WorkItemCreate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkItemCreate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkItemCreate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkItemCreate value)  $default,){
final _that = this;
switch (_that) {
case _WorkItemCreate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkItemCreate value)?  $default,){
final _that = this;
switch (_that) {
case _WorkItemCreate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String boardId,  String categoryId,  String? parentWorkItemId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkItemCreate() when $default != null:
return $default(_that.title,_that.boardId,_that.categoryId,_that.parentWorkItemId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String boardId,  String categoryId,  String? parentWorkItemId)  $default,) {final _that = this;
switch (_that) {
case _WorkItemCreate():
return $default(_that.title,_that.boardId,_that.categoryId,_that.parentWorkItemId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String boardId,  String categoryId,  String? parentWorkItemId)?  $default,) {final _that = this;
switch (_that) {
case _WorkItemCreate() when $default != null:
return $default(_that.title,_that.boardId,_that.categoryId,_that.parentWorkItemId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkItemCreate implements WorkItemCreate {
  const _WorkItemCreate({required this.title, required this.boardId, required this.categoryId, this.parentWorkItemId});
  factory _WorkItemCreate.fromJson(Map<String, dynamic> json) => _$WorkItemCreateFromJson(json);

@override final  String title;
@override final  String boardId;
@override final  String categoryId;
@override final  String? parentWorkItemId;

/// Create a copy of WorkItemCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkItemCreateCopyWith<_WorkItemCreate> get copyWith => __$WorkItemCreateCopyWithImpl<_WorkItemCreate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkItemCreateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkItemCreate&&(identical(other.title, title) || other.title == title)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.parentWorkItemId, parentWorkItemId) || other.parentWorkItemId == parentWorkItemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,boardId,categoryId,parentWorkItemId);

@override
String toString() {
  return 'WorkItemCreate(title: $title, boardId: $boardId, categoryId: $categoryId, parentWorkItemId: $parentWorkItemId)';
}


}

/// @nodoc
abstract mixin class _$WorkItemCreateCopyWith<$Res> implements $WorkItemCreateCopyWith<$Res> {
  factory _$WorkItemCreateCopyWith(_WorkItemCreate value, $Res Function(_WorkItemCreate) _then) = __$WorkItemCreateCopyWithImpl;
@override @useResult
$Res call({
 String title, String boardId, String categoryId, String? parentWorkItemId
});




}
/// @nodoc
class __$WorkItemCreateCopyWithImpl<$Res>
    implements _$WorkItemCreateCopyWith<$Res> {
  __$WorkItemCreateCopyWithImpl(this._self, this._then);

  final _WorkItemCreate _self;
  final $Res Function(_WorkItemCreate) _then;

/// Create a copy of WorkItemCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? boardId = null,Object? categoryId = null,Object? parentWorkItemId = freezed,}) {
  return _then(_WorkItemCreate(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,parentWorkItemId: freezed == parentWorkItemId ? _self.parentWorkItemId : parentWorkItemId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
