// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoardCategoryModel {

 String get id; String get name;@ApiColorSchemeSerializer() ApiColorScheme get color; DateTime? get updatedAt; int get order; bool get isCollapsed; DateTime get createdAt; String get boardId; List<WorkItemModel> get workItems;
/// Create a copy of BoardCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardCategoryModelCopyWith<BoardCategoryModel> get copyWith => _$BoardCategoryModelCopyWithImpl<BoardCategoryModel>(this as BoardCategoryModel, _$identity);

  /// Serializes this BoardCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.order, order) || other.order == order)&&(identical(other.isCollapsed, isCollapsed) || other.isCollapsed == isCollapsed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&const DeepCollectionEquality().equals(other.workItems, workItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color,updatedAt,order,isCollapsed,createdAt,boardId,const DeepCollectionEquality().hash(workItems));

@override
String toString() {
  return 'BoardCategoryModel(id: $id, name: $name, color: $color, updatedAt: $updatedAt, order: $order, isCollapsed: $isCollapsed, createdAt: $createdAt, boardId: $boardId, workItems: $workItems)';
}


}

/// @nodoc
abstract mixin class $BoardCategoryModelCopyWith<$Res>  {
  factory $BoardCategoryModelCopyWith(BoardCategoryModel value, $Res Function(BoardCategoryModel) _then) = _$BoardCategoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name,@ApiColorSchemeSerializer() ApiColorScheme color, DateTime? updatedAt, int order, bool isCollapsed, DateTime createdAt, String boardId, List<WorkItemModel> workItems
});




}
/// @nodoc
class _$BoardCategoryModelCopyWithImpl<$Res>
    implements $BoardCategoryModelCopyWith<$Res> {
  _$BoardCategoryModelCopyWithImpl(this._self, this._then);

  final BoardCategoryModel _self;
  final $Res Function(BoardCategoryModel) _then;

/// Create a copy of BoardCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? color = null,Object? updatedAt = freezed,Object? order = null,Object? isCollapsed = null,Object? createdAt = null,Object? boardId = null,Object? workItems = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ApiColorScheme,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,isCollapsed: null == isCollapsed ? _self.isCollapsed : isCollapsed // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as String,workItems: null == workItems ? _self.workItems : workItems // ignore: cast_nullable_to_non_nullable
as List<WorkItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardCategoryModel].
extension BoardCategoryModelPatterns on BoardCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _BoardCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _BoardCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @ApiColorSchemeSerializer()  ApiColorScheme color,  DateTime? updatedAt,  int order,  bool isCollapsed,  DateTime createdAt,  String boardId,  List<WorkItemModel> workItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.color,_that.updatedAt,_that.order,_that.isCollapsed,_that.createdAt,_that.boardId,_that.workItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @ApiColorSchemeSerializer()  ApiColorScheme color,  DateTime? updatedAt,  int order,  bool isCollapsed,  DateTime createdAt,  String boardId,  List<WorkItemModel> workItems)  $default,) {final _that = this;
switch (_that) {
case _BoardCategoryModel():
return $default(_that.id,_that.name,_that.color,_that.updatedAt,_that.order,_that.isCollapsed,_that.createdAt,_that.boardId,_that.workItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @ApiColorSchemeSerializer()  ApiColorScheme color,  DateTime? updatedAt,  int order,  bool isCollapsed,  DateTime createdAt,  String boardId,  List<WorkItemModel> workItems)?  $default,) {final _that = this;
switch (_that) {
case _BoardCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.color,_that.updatedAt,_that.order,_that.isCollapsed,_that.createdAt,_that.boardId,_that.workItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoardCategoryModel implements BoardCategoryModel {
  const _BoardCategoryModel({required this.id, required this.name, @ApiColorSchemeSerializer() required this.color, this.updatedAt, required this.order, required this.isCollapsed, required this.createdAt, required this.boardId, final  List<WorkItemModel> workItems = const []}): _workItems = workItems;
  factory _BoardCategoryModel.fromJson(Map<String, dynamic> json) => _$BoardCategoryModelFromJson(json);

@override final  String id;
@override final  String name;
@override@ApiColorSchemeSerializer() final  ApiColorScheme color;
@override final  DateTime? updatedAt;
@override final  int order;
@override final  bool isCollapsed;
@override final  DateTime createdAt;
@override final  String boardId;
 final  List<WorkItemModel> _workItems;
@override@JsonKey() List<WorkItemModel> get workItems {
  if (_workItems is EqualUnmodifiableListView) return _workItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workItems);
}


/// Create a copy of BoardCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardCategoryModelCopyWith<_BoardCategoryModel> get copyWith => __$BoardCategoryModelCopyWithImpl<_BoardCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.order, order) || other.order == order)&&(identical(other.isCollapsed, isCollapsed) || other.isCollapsed == isCollapsed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&const DeepCollectionEquality().equals(other._workItems, _workItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color,updatedAt,order,isCollapsed,createdAt,boardId,const DeepCollectionEquality().hash(_workItems));

@override
String toString() {
  return 'BoardCategoryModel(id: $id, name: $name, color: $color, updatedAt: $updatedAt, order: $order, isCollapsed: $isCollapsed, createdAt: $createdAt, boardId: $boardId, workItems: $workItems)';
}


}

/// @nodoc
abstract mixin class _$BoardCategoryModelCopyWith<$Res> implements $BoardCategoryModelCopyWith<$Res> {
  factory _$BoardCategoryModelCopyWith(_BoardCategoryModel value, $Res Function(_BoardCategoryModel) _then) = __$BoardCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@ApiColorSchemeSerializer() ApiColorScheme color, DateTime? updatedAt, int order, bool isCollapsed, DateTime createdAt, String boardId, List<WorkItemModel> workItems
});




}
/// @nodoc
class __$BoardCategoryModelCopyWithImpl<$Res>
    implements _$BoardCategoryModelCopyWith<$Res> {
  __$BoardCategoryModelCopyWithImpl(this._self, this._then);

  final _BoardCategoryModel _self;
  final $Res Function(_BoardCategoryModel) _then;

/// Create a copy of BoardCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? color = null,Object? updatedAt = freezed,Object? order = null,Object? isCollapsed = null,Object? createdAt = null,Object? boardId = null,Object? workItems = null,}) {
  return _then(_BoardCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ApiColorScheme,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,isCollapsed: null == isCollapsed ? _self.isCollapsed : isCollapsed // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as String,workItems: null == workItems ? _self._workItems : workItems // ignore: cast_nullable_to_non_nullable
as List<WorkItemModel>,
  ));
}


}

// dart format on
