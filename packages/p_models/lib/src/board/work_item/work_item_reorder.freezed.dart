// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_item_reorder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkItemReorder {

 String get destinationCategoryId; int get newOrder; MovePosition get position; String? get newParentWorkItemId; String? get sourceCategoryId; String? get relativeToWorkItemId;
/// Create a copy of WorkItemReorder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkItemReorderCopyWith<WorkItemReorder> get copyWith => _$WorkItemReorderCopyWithImpl<WorkItemReorder>(this as WorkItemReorder, _$identity);

  /// Serializes this WorkItemReorder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkItemReorder&&(identical(other.destinationCategoryId, destinationCategoryId) || other.destinationCategoryId == destinationCategoryId)&&(identical(other.newOrder, newOrder) || other.newOrder == newOrder)&&(identical(other.position, position) || other.position == position)&&(identical(other.newParentWorkItemId, newParentWorkItemId) || other.newParentWorkItemId == newParentWorkItemId)&&(identical(other.sourceCategoryId, sourceCategoryId) || other.sourceCategoryId == sourceCategoryId)&&(identical(other.relativeToWorkItemId, relativeToWorkItemId) || other.relativeToWorkItemId == relativeToWorkItemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,destinationCategoryId,newOrder,position,newParentWorkItemId,sourceCategoryId,relativeToWorkItemId);

@override
String toString() {
  return 'WorkItemReorder(destinationCategoryId: $destinationCategoryId, newOrder: $newOrder, position: $position, newParentWorkItemId: $newParentWorkItemId, sourceCategoryId: $sourceCategoryId, relativeToWorkItemId: $relativeToWorkItemId)';
}


}

/// @nodoc
abstract mixin class $WorkItemReorderCopyWith<$Res>  {
  factory $WorkItemReorderCopyWith(WorkItemReorder value, $Res Function(WorkItemReorder) _then) = _$WorkItemReorderCopyWithImpl;
@useResult
$Res call({
 String destinationCategoryId, int newOrder, MovePosition position, String? newParentWorkItemId, String? sourceCategoryId, String? relativeToWorkItemId
});




}
/// @nodoc
class _$WorkItemReorderCopyWithImpl<$Res>
    implements $WorkItemReorderCopyWith<$Res> {
  _$WorkItemReorderCopyWithImpl(this._self, this._then);

  final WorkItemReorder _self;
  final $Res Function(WorkItemReorder) _then;

/// Create a copy of WorkItemReorder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? destinationCategoryId = null,Object? newOrder = null,Object? position = null,Object? newParentWorkItemId = freezed,Object? sourceCategoryId = freezed,Object? relativeToWorkItemId = freezed,}) {
  return _then(_self.copyWith(
destinationCategoryId: null == destinationCategoryId ? _self.destinationCategoryId : destinationCategoryId // ignore: cast_nullable_to_non_nullable
as String,newOrder: null == newOrder ? _self.newOrder : newOrder // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as MovePosition,newParentWorkItemId: freezed == newParentWorkItemId ? _self.newParentWorkItemId : newParentWorkItemId // ignore: cast_nullable_to_non_nullable
as String?,sourceCategoryId: freezed == sourceCategoryId ? _self.sourceCategoryId : sourceCategoryId // ignore: cast_nullable_to_non_nullable
as String?,relativeToWorkItemId: freezed == relativeToWorkItemId ? _self.relativeToWorkItemId : relativeToWorkItemId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkItemReorder].
extension WorkItemReorderPatterns on WorkItemReorder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkItemReorder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkItemReorder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkItemReorder value)  $default,){
final _that = this;
switch (_that) {
case _WorkItemReorder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkItemReorder value)?  $default,){
final _that = this;
switch (_that) {
case _WorkItemReorder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String destinationCategoryId,  int newOrder,  MovePosition position,  String? newParentWorkItemId,  String? sourceCategoryId,  String? relativeToWorkItemId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkItemReorder() when $default != null:
return $default(_that.destinationCategoryId,_that.newOrder,_that.position,_that.newParentWorkItemId,_that.sourceCategoryId,_that.relativeToWorkItemId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String destinationCategoryId,  int newOrder,  MovePosition position,  String? newParentWorkItemId,  String? sourceCategoryId,  String? relativeToWorkItemId)  $default,) {final _that = this;
switch (_that) {
case _WorkItemReorder():
return $default(_that.destinationCategoryId,_that.newOrder,_that.position,_that.newParentWorkItemId,_that.sourceCategoryId,_that.relativeToWorkItemId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String destinationCategoryId,  int newOrder,  MovePosition position,  String? newParentWorkItemId,  String? sourceCategoryId,  String? relativeToWorkItemId)?  $default,) {final _that = this;
switch (_that) {
case _WorkItemReorder() when $default != null:
return $default(_that.destinationCategoryId,_that.newOrder,_that.position,_that.newParentWorkItemId,_that.sourceCategoryId,_that.relativeToWorkItemId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkItemReorder implements WorkItemReorder {
  const _WorkItemReorder({required this.destinationCategoryId, required this.newOrder, required this.position, this.newParentWorkItemId, this.sourceCategoryId, this.relativeToWorkItemId});
  factory _WorkItemReorder.fromJson(Map<String, dynamic> json) => _$WorkItemReorderFromJson(json);

@override final  String destinationCategoryId;
@override final  int newOrder;
@override final  MovePosition position;
@override final  String? newParentWorkItemId;
@override final  String? sourceCategoryId;
@override final  String? relativeToWorkItemId;

/// Create a copy of WorkItemReorder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkItemReorderCopyWith<_WorkItemReorder> get copyWith => __$WorkItemReorderCopyWithImpl<_WorkItemReorder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkItemReorderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkItemReorder&&(identical(other.destinationCategoryId, destinationCategoryId) || other.destinationCategoryId == destinationCategoryId)&&(identical(other.newOrder, newOrder) || other.newOrder == newOrder)&&(identical(other.position, position) || other.position == position)&&(identical(other.newParentWorkItemId, newParentWorkItemId) || other.newParentWorkItemId == newParentWorkItemId)&&(identical(other.sourceCategoryId, sourceCategoryId) || other.sourceCategoryId == sourceCategoryId)&&(identical(other.relativeToWorkItemId, relativeToWorkItemId) || other.relativeToWorkItemId == relativeToWorkItemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,destinationCategoryId,newOrder,position,newParentWorkItemId,sourceCategoryId,relativeToWorkItemId);

@override
String toString() {
  return 'WorkItemReorder(destinationCategoryId: $destinationCategoryId, newOrder: $newOrder, position: $position, newParentWorkItemId: $newParentWorkItemId, sourceCategoryId: $sourceCategoryId, relativeToWorkItemId: $relativeToWorkItemId)';
}


}

/// @nodoc
abstract mixin class _$WorkItemReorderCopyWith<$Res> implements $WorkItemReorderCopyWith<$Res> {
  factory _$WorkItemReorderCopyWith(_WorkItemReorder value, $Res Function(_WorkItemReorder) _then) = __$WorkItemReorderCopyWithImpl;
@override @useResult
$Res call({
 String destinationCategoryId, int newOrder, MovePosition position, String? newParentWorkItemId, String? sourceCategoryId, String? relativeToWorkItemId
});




}
/// @nodoc
class __$WorkItemReorderCopyWithImpl<$Res>
    implements _$WorkItemReorderCopyWith<$Res> {
  __$WorkItemReorderCopyWithImpl(this._self, this._then);

  final _WorkItemReorder _self;
  final $Res Function(_WorkItemReorder) _then;

/// Create a copy of WorkItemReorder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? destinationCategoryId = null,Object? newOrder = null,Object? position = null,Object? newParentWorkItemId = freezed,Object? sourceCategoryId = freezed,Object? relativeToWorkItemId = freezed,}) {
  return _then(_WorkItemReorder(
destinationCategoryId: null == destinationCategoryId ? _self.destinationCategoryId : destinationCategoryId // ignore: cast_nullable_to_non_nullable
as String,newOrder: null == newOrder ? _self.newOrder : newOrder // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as MovePosition,newParentWorkItemId: freezed == newParentWorkItemId ? _self.newParentWorkItemId : newParentWorkItemId // ignore: cast_nullable_to_non_nullable
as String?,sourceCategoryId: freezed == sourceCategoryId ? _self.sourceCategoryId : sourceCategoryId // ignore: cast_nullable_to_non_nullable
as String?,relativeToWorkItemId: freezed == relativeToWorkItemId ? _self.relativeToWorkItemId : relativeToWorkItemId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
