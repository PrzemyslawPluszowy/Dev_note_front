// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_reorder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoardCategoryReorderRequest {

 List<CategoryReorderItem> get categories;
/// Create a copy of BoardCategoryReorderRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardCategoryReorderRequestCopyWith<BoardCategoryReorderRequest> get copyWith => _$BoardCategoryReorderRequestCopyWithImpl<BoardCategoryReorderRequest>(this as BoardCategoryReorderRequest, _$identity);

  /// Serializes this BoardCategoryReorderRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardCategoryReorderRequest&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'BoardCategoryReorderRequest(categories: $categories)';
}


}

/// @nodoc
abstract mixin class $BoardCategoryReorderRequestCopyWith<$Res>  {
  factory $BoardCategoryReorderRequestCopyWith(BoardCategoryReorderRequest value, $Res Function(BoardCategoryReorderRequest) _then) = _$BoardCategoryReorderRequestCopyWithImpl;
@useResult
$Res call({
 List<CategoryReorderItem> categories
});




}
/// @nodoc
class _$BoardCategoryReorderRequestCopyWithImpl<$Res>
    implements $BoardCategoryReorderRequestCopyWith<$Res> {
  _$BoardCategoryReorderRequestCopyWithImpl(this._self, this._then);

  final BoardCategoryReorderRequest _self;
  final $Res Function(BoardCategoryReorderRequest) _then;

/// Create a copy of BoardCategoryReorderRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryReorderItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardCategoryReorderRequest].
extension BoardCategoryReorderRequestPatterns on BoardCategoryReorderRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardCategoryReorderRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardCategoryReorderRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardCategoryReorderRequest value)  $default,){
final _that = this;
switch (_that) {
case _BoardCategoryReorderRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardCategoryReorderRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BoardCategoryReorderRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CategoryReorderItem> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardCategoryReorderRequest() when $default != null:
return $default(_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CategoryReorderItem> categories)  $default,) {final _that = this;
switch (_that) {
case _BoardCategoryReorderRequest():
return $default(_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CategoryReorderItem> categories)?  $default,) {final _that = this;
switch (_that) {
case _BoardCategoryReorderRequest() when $default != null:
return $default(_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoardCategoryReorderRequest implements BoardCategoryReorderRequest {
  const _BoardCategoryReorderRequest({required final  List<CategoryReorderItem> categories}): _categories = categories;
  factory _BoardCategoryReorderRequest.fromJson(Map<String, dynamic> json) => _$BoardCategoryReorderRequestFromJson(json);

 final  List<CategoryReorderItem> _categories;
@override List<CategoryReorderItem> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of BoardCategoryReorderRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardCategoryReorderRequestCopyWith<_BoardCategoryReorderRequest> get copyWith => __$BoardCategoryReorderRequestCopyWithImpl<_BoardCategoryReorderRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardCategoryReorderRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardCategoryReorderRequest&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'BoardCategoryReorderRequest(categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$BoardCategoryReorderRequestCopyWith<$Res> implements $BoardCategoryReorderRequestCopyWith<$Res> {
  factory _$BoardCategoryReorderRequestCopyWith(_BoardCategoryReorderRequest value, $Res Function(_BoardCategoryReorderRequest) _then) = __$BoardCategoryReorderRequestCopyWithImpl;
@override @useResult
$Res call({
 List<CategoryReorderItem> categories
});




}
/// @nodoc
class __$BoardCategoryReorderRequestCopyWithImpl<$Res>
    implements _$BoardCategoryReorderRequestCopyWith<$Res> {
  __$BoardCategoryReorderRequestCopyWithImpl(this._self, this._then);

  final _BoardCategoryReorderRequest _self;
  final $Res Function(_BoardCategoryReorderRequest) _then;

/// Create a copy of BoardCategoryReorderRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(_BoardCategoryReorderRequest(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryReorderItem>,
  ));
}


}


/// @nodoc
mixin _$CategoryReorderItem {

 String get id; int get order;
/// Create a copy of CategoryReorderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryReorderItemCopyWith<CategoryReorderItem> get copyWith => _$CategoryReorderItemCopyWithImpl<CategoryReorderItem>(this as CategoryReorderItem, _$identity);

  /// Serializes this CategoryReorderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryReorderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order);

@override
String toString() {
  return 'CategoryReorderItem(id: $id, order: $order)';
}


}

/// @nodoc
abstract mixin class $CategoryReorderItemCopyWith<$Res>  {
  factory $CategoryReorderItemCopyWith(CategoryReorderItem value, $Res Function(CategoryReorderItem) _then) = _$CategoryReorderItemCopyWithImpl;
@useResult
$Res call({
 String id, int order
});




}
/// @nodoc
class _$CategoryReorderItemCopyWithImpl<$Res>
    implements $CategoryReorderItemCopyWith<$Res> {
  _$CategoryReorderItemCopyWithImpl(this._self, this._then);

  final CategoryReorderItem _self;
  final $Res Function(CategoryReorderItem) _then;

/// Create a copy of CategoryReorderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryReorderItem].
extension CategoryReorderItemPatterns on CategoryReorderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryReorderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryReorderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryReorderItem value)  $default,){
final _that = this;
switch (_that) {
case _CategoryReorderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryReorderItem value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryReorderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryReorderItem() when $default != null:
return $default(_that.id,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int order)  $default,) {final _that = this;
switch (_that) {
case _CategoryReorderItem():
return $default(_that.id,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int order)?  $default,) {final _that = this;
switch (_that) {
case _CategoryReorderItem() when $default != null:
return $default(_that.id,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryReorderItem implements CategoryReorderItem {
  const _CategoryReorderItem({required this.id, required this.order});
  factory _CategoryReorderItem.fromJson(Map<String, dynamic> json) => _$CategoryReorderItemFromJson(json);

@override final  String id;
@override final  int order;

/// Create a copy of CategoryReorderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryReorderItemCopyWith<_CategoryReorderItem> get copyWith => __$CategoryReorderItemCopyWithImpl<_CategoryReorderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryReorderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryReorderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order);

@override
String toString() {
  return 'CategoryReorderItem(id: $id, order: $order)';
}


}

/// @nodoc
abstract mixin class _$CategoryReorderItemCopyWith<$Res> implements $CategoryReorderItemCopyWith<$Res> {
  factory _$CategoryReorderItemCopyWith(_CategoryReorderItem value, $Res Function(_CategoryReorderItem) _then) = __$CategoryReorderItemCopyWithImpl;
@override @useResult
$Res call({
 String id, int order
});




}
/// @nodoc
class __$CategoryReorderItemCopyWithImpl<$Res>
    implements _$CategoryReorderItemCopyWith<$Res> {
  __$CategoryReorderItemCopyWithImpl(this._self, this._then);

  final _CategoryReorderItem _self;
  final $Res Function(_CategoryReorderItem) _then;

/// Create a copy of CategoryReorderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,}) {
  return _then(_CategoryReorderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
