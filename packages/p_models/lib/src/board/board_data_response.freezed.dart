// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoardDataResponse {

 BoardFullModel get board; List<BoardCategoryModel> get categories;
/// Create a copy of BoardDataResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardDataResponseCopyWith<BoardDataResponse> get copyWith => _$BoardDataResponseCopyWithImpl<BoardDataResponse>(this as BoardDataResponse, _$identity);

  /// Serializes this BoardDataResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardDataResponse&&(identical(other.board, board) || other.board == board)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,board,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'BoardDataResponse(board: $board, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $BoardDataResponseCopyWith<$Res>  {
  factory $BoardDataResponseCopyWith(BoardDataResponse value, $Res Function(BoardDataResponse) _then) = _$BoardDataResponseCopyWithImpl;
@useResult
$Res call({
 BoardFullModel board, List<BoardCategoryModel> categories
});


$BoardFullModelCopyWith<$Res> get board;

}
/// @nodoc
class _$BoardDataResponseCopyWithImpl<$Res>
    implements $BoardDataResponseCopyWith<$Res> {
  _$BoardDataResponseCopyWithImpl(this._self, this._then);

  final BoardDataResponse _self;
  final $Res Function(BoardDataResponse) _then;

/// Create a copy of BoardDataResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? board = null,Object? categories = null,}) {
  return _then(_self.copyWith(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as BoardFullModel,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<BoardCategoryModel>,
  ));
}
/// Create a copy of BoardDataResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardFullModelCopyWith<$Res> get board {
  
  return $BoardFullModelCopyWith<$Res>(_self.board, (value) {
    return _then(_self.copyWith(board: value));
  });
}
}


/// Adds pattern-matching-related methods to [BoardDataResponse].
extension BoardDataResponsePatterns on BoardDataResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardDataResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardDataResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardDataResponse value)  $default,){
final _that = this;
switch (_that) {
case _BoardDataResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardDataResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BoardDataResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BoardFullModel board,  List<BoardCategoryModel> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardDataResponse() when $default != null:
return $default(_that.board,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BoardFullModel board,  List<BoardCategoryModel> categories)  $default,) {final _that = this;
switch (_that) {
case _BoardDataResponse():
return $default(_that.board,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BoardFullModel board,  List<BoardCategoryModel> categories)?  $default,) {final _that = this;
switch (_that) {
case _BoardDataResponse() when $default != null:
return $default(_that.board,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoardDataResponse implements BoardDataResponse {
  const _BoardDataResponse({required this.board, final  List<BoardCategoryModel> categories = const []}): _categories = categories;
  factory _BoardDataResponse.fromJson(Map<String, dynamic> json) => _$BoardDataResponseFromJson(json);

@override final  BoardFullModel board;
 final  List<BoardCategoryModel> _categories;
@override@JsonKey() List<BoardCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of BoardDataResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardDataResponseCopyWith<_BoardDataResponse> get copyWith => __$BoardDataResponseCopyWithImpl<_BoardDataResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardDataResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardDataResponse&&(identical(other.board, board) || other.board == board)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,board,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'BoardDataResponse(board: $board, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$BoardDataResponseCopyWith<$Res> implements $BoardDataResponseCopyWith<$Res> {
  factory _$BoardDataResponseCopyWith(_BoardDataResponse value, $Res Function(_BoardDataResponse) _then) = __$BoardDataResponseCopyWithImpl;
@override @useResult
$Res call({
 BoardFullModel board, List<BoardCategoryModel> categories
});


@override $BoardFullModelCopyWith<$Res> get board;

}
/// @nodoc
class __$BoardDataResponseCopyWithImpl<$Res>
    implements _$BoardDataResponseCopyWith<$Res> {
  __$BoardDataResponseCopyWithImpl(this._self, this._then);

  final _BoardDataResponse _self;
  final $Res Function(_BoardDataResponse) _then;

/// Create a copy of BoardDataResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? board = null,Object? categories = null,}) {
  return _then(_BoardDataResponse(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as BoardFullModel,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<BoardCategoryModel>,
  ));
}

/// Create a copy of BoardDataResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardFullModelCopyWith<$Res> get board {
  
  return $BoardFullModelCopyWith<$Res>(_self.board, (value) {
    return _then(_self.copyWith(board: value));
  });
}
}

// dart format on
