// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_project_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditProjectRequest {

 String get name; String? get description;@ApiColorSchemeSerializer() ApiColorScheme? get primaryColor;@PhosphorIconsSerializer() ApiPhosphorIcons? get icon;
/// Create a copy of EditProjectRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditProjectRequestCopyWith<EditProjectRequest> get copyWith => _$EditProjectRequestCopyWithImpl<EditProjectRequest>(this as EditProjectRequest, _$identity);

  /// Serializes this EditProjectRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditProjectRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,primaryColor,icon);

@override
String toString() {
  return 'EditProjectRequest(name: $name, description: $description, primaryColor: $primaryColor, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $EditProjectRequestCopyWith<$Res>  {
  factory $EditProjectRequestCopyWith(EditProjectRequest value, $Res Function(EditProjectRequest) _then) = _$EditProjectRequestCopyWithImpl;
@useResult
$Res call({
 String name, String? description,@ApiColorSchemeSerializer() ApiColorScheme? primaryColor,@PhosphorIconsSerializer() ApiPhosphorIcons? icon
});




}
/// @nodoc
class _$EditProjectRequestCopyWithImpl<$Res>
    implements $EditProjectRequestCopyWith<$Res> {
  _$EditProjectRequestCopyWithImpl(this._self, this._then);

  final EditProjectRequest _self;
  final $Res Function(EditProjectRequest) _then;

/// Create a copy of EditProjectRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? primaryColor = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,primaryColor: freezed == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as ApiColorScheme?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as ApiPhosphorIcons?,
  ));
}

}


/// Adds pattern-matching-related methods to [EditProjectRequest].
extension EditProjectRequestPatterns on EditProjectRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditProjectRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditProjectRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditProjectRequest value)  $default,){
final _that = this;
switch (_that) {
case _EditProjectRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditProjectRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EditProjectRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description, @ApiColorSchemeSerializer()  ApiColorScheme? primaryColor, @PhosphorIconsSerializer()  ApiPhosphorIcons? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditProjectRequest() when $default != null:
return $default(_that.name,_that.description,_that.primaryColor,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description, @ApiColorSchemeSerializer()  ApiColorScheme? primaryColor, @PhosphorIconsSerializer()  ApiPhosphorIcons? icon)  $default,) {final _that = this;
switch (_that) {
case _EditProjectRequest():
return $default(_that.name,_that.description,_that.primaryColor,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description, @ApiColorSchemeSerializer()  ApiColorScheme? primaryColor, @PhosphorIconsSerializer()  ApiPhosphorIcons? icon)?  $default,) {final _that = this;
switch (_that) {
case _EditProjectRequest() when $default != null:
return $default(_that.name,_that.description,_that.primaryColor,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditProjectRequest implements EditProjectRequest {
  const _EditProjectRequest({required this.name, this.description, @ApiColorSchemeSerializer() this.primaryColor, @PhosphorIconsSerializer() this.icon});
  factory _EditProjectRequest.fromJson(Map<String, dynamic> json) => _$EditProjectRequestFromJson(json);

@override final  String name;
@override final  String? description;
@override@ApiColorSchemeSerializer() final  ApiColorScheme? primaryColor;
@override@PhosphorIconsSerializer() final  ApiPhosphorIcons? icon;

/// Create a copy of EditProjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditProjectRequestCopyWith<_EditProjectRequest> get copyWith => __$EditProjectRequestCopyWithImpl<_EditProjectRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditProjectRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditProjectRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,primaryColor,icon);

@override
String toString() {
  return 'EditProjectRequest(name: $name, description: $description, primaryColor: $primaryColor, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$EditProjectRequestCopyWith<$Res> implements $EditProjectRequestCopyWith<$Res> {
  factory _$EditProjectRequestCopyWith(_EditProjectRequest value, $Res Function(_EditProjectRequest) _then) = __$EditProjectRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description,@ApiColorSchemeSerializer() ApiColorScheme? primaryColor,@PhosphorIconsSerializer() ApiPhosphorIcons? icon
});




}
/// @nodoc
class __$EditProjectRequestCopyWithImpl<$Res>
    implements _$EditProjectRequestCopyWith<$Res> {
  __$EditProjectRequestCopyWithImpl(this._self, this._then);

  final _EditProjectRequest _self;
  final $Res Function(_EditProjectRequest) _then;

/// Create a copy of EditProjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? primaryColor = freezed,Object? icon = freezed,}) {
  return _then(_EditProjectRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,primaryColor: freezed == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as ApiColorScheme?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as ApiPhosphorIcons?,
  ));
}


}

// dart format on
