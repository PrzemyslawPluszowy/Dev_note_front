// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_workspace_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateWorkspaceModel {

 String get name; String? get description;@PhosphorIconsSerializer() ApiPhosphorIcons? get icon;@ApiColorSchemeSerializer() ApiColorScheme? get primaryColor;
/// Create a copy of CreateWorkspaceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWorkspaceModelCopyWith<CreateWorkspaceModel> get copyWith => _$CreateWorkspaceModelCopyWithImpl<CreateWorkspaceModel>(this as CreateWorkspaceModel, _$identity);

  /// Serializes this CreateWorkspaceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWorkspaceModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,icon,primaryColor);

@override
String toString() {
  return 'CreateWorkspaceModel(name: $name, description: $description, icon: $icon, primaryColor: $primaryColor)';
}


}

/// @nodoc
abstract mixin class $CreateWorkspaceModelCopyWith<$Res>  {
  factory $CreateWorkspaceModelCopyWith(CreateWorkspaceModel value, $Res Function(CreateWorkspaceModel) _then) = _$CreateWorkspaceModelCopyWithImpl;
@useResult
$Res call({
 String name, String? description,@PhosphorIconsSerializer() ApiPhosphorIcons? icon,@ApiColorSchemeSerializer() ApiColorScheme? primaryColor
});




}
/// @nodoc
class _$CreateWorkspaceModelCopyWithImpl<$Res>
    implements $CreateWorkspaceModelCopyWith<$Res> {
  _$CreateWorkspaceModelCopyWithImpl(this._self, this._then);

  final CreateWorkspaceModel _self;
  final $Res Function(CreateWorkspaceModel) _then;

/// Create a copy of CreateWorkspaceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? icon = freezed,Object? primaryColor = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as ApiPhosphorIcons?,primaryColor: freezed == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as ApiColorScheme?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateWorkspaceModel].
extension CreateWorkspaceModelPatterns on CreateWorkspaceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateWorkspaceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateWorkspaceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateWorkspaceModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateWorkspaceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateWorkspaceModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateWorkspaceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description, @PhosphorIconsSerializer()  ApiPhosphorIcons? icon, @ApiColorSchemeSerializer()  ApiColorScheme? primaryColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateWorkspaceModel() when $default != null:
return $default(_that.name,_that.description,_that.icon,_that.primaryColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description, @PhosphorIconsSerializer()  ApiPhosphorIcons? icon, @ApiColorSchemeSerializer()  ApiColorScheme? primaryColor)  $default,) {final _that = this;
switch (_that) {
case _CreateWorkspaceModel():
return $default(_that.name,_that.description,_that.icon,_that.primaryColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description, @PhosphorIconsSerializer()  ApiPhosphorIcons? icon, @ApiColorSchemeSerializer()  ApiColorScheme? primaryColor)?  $default,) {final _that = this;
switch (_that) {
case _CreateWorkspaceModel() when $default != null:
return $default(_that.name,_that.description,_that.icon,_that.primaryColor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateWorkspaceModel implements CreateWorkspaceModel {
  const _CreateWorkspaceModel({required this.name, this.description, @PhosphorIconsSerializer() this.icon, @ApiColorSchemeSerializer() this.primaryColor});
  factory _CreateWorkspaceModel.fromJson(Map<String, dynamic> json) => _$CreateWorkspaceModelFromJson(json);

@override final  String name;
@override final  String? description;
@override@PhosphorIconsSerializer() final  ApiPhosphorIcons? icon;
@override@ApiColorSchemeSerializer() final  ApiColorScheme? primaryColor;

/// Create a copy of CreateWorkspaceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateWorkspaceModelCopyWith<_CreateWorkspaceModel> get copyWith => __$CreateWorkspaceModelCopyWithImpl<_CreateWorkspaceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateWorkspaceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateWorkspaceModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,icon,primaryColor);

@override
String toString() {
  return 'CreateWorkspaceModel(name: $name, description: $description, icon: $icon, primaryColor: $primaryColor)';
}


}

/// @nodoc
abstract mixin class _$CreateWorkspaceModelCopyWith<$Res> implements $CreateWorkspaceModelCopyWith<$Res> {
  factory _$CreateWorkspaceModelCopyWith(_CreateWorkspaceModel value, $Res Function(_CreateWorkspaceModel) _then) = __$CreateWorkspaceModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description,@PhosphorIconsSerializer() ApiPhosphorIcons? icon,@ApiColorSchemeSerializer() ApiColorScheme? primaryColor
});




}
/// @nodoc
class __$CreateWorkspaceModelCopyWithImpl<$Res>
    implements _$CreateWorkspaceModelCopyWith<$Res> {
  __$CreateWorkspaceModelCopyWithImpl(this._self, this._then);

  final _CreateWorkspaceModel _self;
  final $Res Function(_CreateWorkspaceModel) _then;

/// Create a copy of CreateWorkspaceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? icon = freezed,Object? primaryColor = freezed,}) {
  return _then(_CreateWorkspaceModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as ApiPhosphorIcons?,primaryColor: freezed == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as ApiColorScheme?,
  ));
}


}

// dart format on
