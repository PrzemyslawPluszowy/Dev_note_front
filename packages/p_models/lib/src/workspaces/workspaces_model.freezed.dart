// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspaces_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkspacesModel {

 String get id; String get name; String? get description;@PhosphorIconsSerializer() ApiPhosphorIcons get icon;@ApiColorSchemeSerializer() ApiColorScheme get primaryColor; DateTime get createdAt;@WorkspaceRoleSerializer() WorkspaceRole get workspaceRole; List<ProjectModel> get projects;
/// Create a copy of WorkspacesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspacesModelCopyWith<WorkspacesModel> get copyWith => _$WorkspacesModelCopyWithImpl<WorkspacesModel>(this as WorkspacesModel, _$identity);

  /// Serializes this WorkspacesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkspacesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.workspaceRole, workspaceRole) || other.workspaceRole == workspaceRole)&&const DeepCollectionEquality().equals(other.projects, projects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,icon,primaryColor,createdAt,workspaceRole,const DeepCollectionEquality().hash(projects));

@override
String toString() {
  return 'WorkspacesModel(id: $id, name: $name, description: $description, icon: $icon, primaryColor: $primaryColor, createdAt: $createdAt, workspaceRole: $workspaceRole, projects: $projects)';
}


}

/// @nodoc
abstract mixin class $WorkspacesModelCopyWith<$Res>  {
  factory $WorkspacesModelCopyWith(WorkspacesModel value, $Res Function(WorkspacesModel) _then) = _$WorkspacesModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description,@PhosphorIconsSerializer() ApiPhosphorIcons icon,@ApiColorSchemeSerializer() ApiColorScheme primaryColor, DateTime createdAt,@WorkspaceRoleSerializer() WorkspaceRole workspaceRole, List<ProjectModel> projects
});




}
/// @nodoc
class _$WorkspacesModelCopyWithImpl<$Res>
    implements $WorkspacesModelCopyWith<$Res> {
  _$WorkspacesModelCopyWithImpl(this._self, this._then);

  final WorkspacesModel _self;
  final $Res Function(WorkspacesModel) _then;

/// Create a copy of WorkspacesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? icon = null,Object? primaryColor = null,Object? createdAt = null,Object? workspaceRole = null,Object? projects = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as ApiPhosphorIcons,primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as ApiColorScheme,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,workspaceRole: null == workspaceRole ? _self.workspaceRole : workspaceRole // ignore: cast_nullable_to_non_nullable
as WorkspaceRole,projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkspacesModel].
extension WorkspacesModelPatterns on WorkspacesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkspacesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkspacesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkspacesModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkspacesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkspacesModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkspacesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description, @PhosphorIconsSerializer()  ApiPhosphorIcons icon, @ApiColorSchemeSerializer()  ApiColorScheme primaryColor,  DateTime createdAt, @WorkspaceRoleSerializer()  WorkspaceRole workspaceRole,  List<ProjectModel> projects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkspacesModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.icon,_that.primaryColor,_that.createdAt,_that.workspaceRole,_that.projects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description, @PhosphorIconsSerializer()  ApiPhosphorIcons icon, @ApiColorSchemeSerializer()  ApiColorScheme primaryColor,  DateTime createdAt, @WorkspaceRoleSerializer()  WorkspaceRole workspaceRole,  List<ProjectModel> projects)  $default,) {final _that = this;
switch (_that) {
case _WorkspacesModel():
return $default(_that.id,_that.name,_that.description,_that.icon,_that.primaryColor,_that.createdAt,_that.workspaceRole,_that.projects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description, @PhosphorIconsSerializer()  ApiPhosphorIcons icon, @ApiColorSchemeSerializer()  ApiColorScheme primaryColor,  DateTime createdAt, @WorkspaceRoleSerializer()  WorkspaceRole workspaceRole,  List<ProjectModel> projects)?  $default,) {final _that = this;
switch (_that) {
case _WorkspacesModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.icon,_that.primaryColor,_that.createdAt,_that.workspaceRole,_that.projects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkspacesModel implements WorkspacesModel {
  const _WorkspacesModel({required this.id, required this.name, this.description, @PhosphorIconsSerializer() required this.icon, @ApiColorSchemeSerializer() required this.primaryColor, required this.createdAt, @WorkspaceRoleSerializer() required this.workspaceRole, required final  List<ProjectModel> projects}): _projects = projects;
  factory _WorkspacesModel.fromJson(Map<String, dynamic> json) => _$WorkspacesModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override@PhosphorIconsSerializer() final  ApiPhosphorIcons icon;
@override@ApiColorSchemeSerializer() final  ApiColorScheme primaryColor;
@override final  DateTime createdAt;
@override@WorkspaceRoleSerializer() final  WorkspaceRole workspaceRole;
 final  List<ProjectModel> _projects;
@override List<ProjectModel> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}


/// Create a copy of WorkspacesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkspacesModelCopyWith<_WorkspacesModel> get copyWith => __$WorkspacesModelCopyWithImpl<_WorkspacesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkspacesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkspacesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.workspaceRole, workspaceRole) || other.workspaceRole == workspaceRole)&&const DeepCollectionEquality().equals(other._projects, _projects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,icon,primaryColor,createdAt,workspaceRole,const DeepCollectionEquality().hash(_projects));

@override
String toString() {
  return 'WorkspacesModel(id: $id, name: $name, description: $description, icon: $icon, primaryColor: $primaryColor, createdAt: $createdAt, workspaceRole: $workspaceRole, projects: $projects)';
}


}

/// @nodoc
abstract mixin class _$WorkspacesModelCopyWith<$Res> implements $WorkspacesModelCopyWith<$Res> {
  factory _$WorkspacesModelCopyWith(_WorkspacesModel value, $Res Function(_WorkspacesModel) _then) = __$WorkspacesModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description,@PhosphorIconsSerializer() ApiPhosphorIcons icon,@ApiColorSchemeSerializer() ApiColorScheme primaryColor, DateTime createdAt,@WorkspaceRoleSerializer() WorkspaceRole workspaceRole, List<ProjectModel> projects
});




}
/// @nodoc
class __$WorkspacesModelCopyWithImpl<$Res>
    implements _$WorkspacesModelCopyWith<$Res> {
  __$WorkspacesModelCopyWithImpl(this._self, this._then);

  final _WorkspacesModel _self;
  final $Res Function(_WorkspacesModel) _then;

/// Create a copy of WorkspacesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? icon = null,Object? primaryColor = null,Object? createdAt = null,Object? workspaceRole = null,Object? projects = null,}) {
  return _then(_WorkspacesModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as ApiPhosphorIcons,primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as ApiColorScheme,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,workspaceRole: null == workspaceRole ? _self.workspaceRole : workspaceRole // ignore: cast_nullable_to_non_nullable
as WorkspaceRole,projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectModel>,
  ));
}


}


/// @nodoc
mixin _$ProjectModel {

 String get id; String get name; String get workspaceId; DateTime get createdAt; String? get description;@PhosphorIconsSerializer() ApiPhosphorIcons get icon;@ApiColorSchemeSerializer() ApiColorScheme get primaryColor;@ProjectRoleSerializer() ProjectRole get projectRole; List<BoardShortModel> get boards;
/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectModelCopyWith<ProjectModel> get copyWith => _$ProjectModelCopyWithImpl<ProjectModel>(this as ProjectModel, _$identity);

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.projectRole, projectRole) || other.projectRole == projectRole)&&const DeepCollectionEquality().equals(other.boards, boards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,workspaceId,createdAt,description,icon,primaryColor,projectRole,const DeepCollectionEquality().hash(boards));

@override
String toString() {
  return 'ProjectModel(id: $id, name: $name, workspaceId: $workspaceId, createdAt: $createdAt, description: $description, icon: $icon, primaryColor: $primaryColor, projectRole: $projectRole, boards: $boards)';
}


}

/// @nodoc
abstract mixin class $ProjectModelCopyWith<$Res>  {
  factory $ProjectModelCopyWith(ProjectModel value, $Res Function(ProjectModel) _then) = _$ProjectModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String workspaceId, DateTime createdAt, String? description,@PhosphorIconsSerializer() ApiPhosphorIcons icon,@ApiColorSchemeSerializer() ApiColorScheme primaryColor,@ProjectRoleSerializer() ProjectRole projectRole, List<BoardShortModel> boards
});




}
/// @nodoc
class _$ProjectModelCopyWithImpl<$Res>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._self, this._then);

  final ProjectModel _self;
  final $Res Function(ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? workspaceId = null,Object? createdAt = null,Object? description = freezed,Object? icon = null,Object? primaryColor = null,Object? projectRole = null,Object? boards = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as ApiPhosphorIcons,primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as ApiColorScheme,projectRole: null == projectRole ? _self.projectRole : projectRole // ignore: cast_nullable_to_non_nullable
as ProjectRole,boards: null == boards ? _self.boards : boards // ignore: cast_nullable_to_non_nullable
as List<BoardShortModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectModel].
extension ProjectModelPatterns on ProjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String workspaceId,  DateTime createdAt,  String? description, @PhosphorIconsSerializer()  ApiPhosphorIcons icon, @ApiColorSchemeSerializer()  ApiColorScheme primaryColor, @ProjectRoleSerializer()  ProjectRole projectRole,  List<BoardShortModel> boards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.name,_that.workspaceId,_that.createdAt,_that.description,_that.icon,_that.primaryColor,_that.projectRole,_that.boards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String workspaceId,  DateTime createdAt,  String? description, @PhosphorIconsSerializer()  ApiPhosphorIcons icon, @ApiColorSchemeSerializer()  ApiColorScheme primaryColor, @ProjectRoleSerializer()  ProjectRole projectRole,  List<BoardShortModel> boards)  $default,) {final _that = this;
switch (_that) {
case _ProjectModel():
return $default(_that.id,_that.name,_that.workspaceId,_that.createdAt,_that.description,_that.icon,_that.primaryColor,_that.projectRole,_that.boards);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String workspaceId,  DateTime createdAt,  String? description, @PhosphorIconsSerializer()  ApiPhosphorIcons icon, @ApiColorSchemeSerializer()  ApiColorScheme primaryColor, @ProjectRoleSerializer()  ProjectRole projectRole,  List<BoardShortModel> boards)?  $default,) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.name,_that.workspaceId,_that.createdAt,_that.description,_that.icon,_that.primaryColor,_that.projectRole,_that.boards);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectModel implements ProjectModel {
  const _ProjectModel({required this.id, required this.name, required this.workspaceId, required this.createdAt, this.description, @PhosphorIconsSerializer() required this.icon, @ApiColorSchemeSerializer() required this.primaryColor, @ProjectRoleSerializer() required this.projectRole, required final  List<BoardShortModel> boards}): _boards = boards;
  factory _ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String workspaceId;
@override final  DateTime createdAt;
@override final  String? description;
@override@PhosphorIconsSerializer() final  ApiPhosphorIcons icon;
@override@ApiColorSchemeSerializer() final  ApiColorScheme primaryColor;
@override@ProjectRoleSerializer() final  ProjectRole projectRole;
 final  List<BoardShortModel> _boards;
@override List<BoardShortModel> get boards {
  if (_boards is EqualUnmodifiableListView) return _boards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_boards);
}


/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectModelCopyWith<_ProjectModel> get copyWith => __$ProjectModelCopyWithImpl<_ProjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.projectRole, projectRole) || other.projectRole == projectRole)&&const DeepCollectionEquality().equals(other._boards, _boards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,workspaceId,createdAt,description,icon,primaryColor,projectRole,const DeepCollectionEquality().hash(_boards));

@override
String toString() {
  return 'ProjectModel(id: $id, name: $name, workspaceId: $workspaceId, createdAt: $createdAt, description: $description, icon: $icon, primaryColor: $primaryColor, projectRole: $projectRole, boards: $boards)';
}


}

/// @nodoc
abstract mixin class _$ProjectModelCopyWith<$Res> implements $ProjectModelCopyWith<$Res> {
  factory _$ProjectModelCopyWith(_ProjectModel value, $Res Function(_ProjectModel) _then) = __$ProjectModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String workspaceId, DateTime createdAt, String? description,@PhosphorIconsSerializer() ApiPhosphorIcons icon,@ApiColorSchemeSerializer() ApiColorScheme primaryColor,@ProjectRoleSerializer() ProjectRole projectRole, List<BoardShortModel> boards
});




}
/// @nodoc
class __$ProjectModelCopyWithImpl<$Res>
    implements _$ProjectModelCopyWith<$Res> {
  __$ProjectModelCopyWithImpl(this._self, this._then);

  final _ProjectModel _self;
  final $Res Function(_ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? workspaceId = null,Object? createdAt = null,Object? description = freezed,Object? icon = null,Object? primaryColor = null,Object? projectRole = null,Object? boards = null,}) {
  return _then(_ProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as ApiPhosphorIcons,primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as ApiColorScheme,projectRole: null == projectRole ? _self.projectRole : projectRole // ignore: cast_nullable_to_non_nullable
as ProjectRole,boards: null == boards ? _self._boards : boards // ignore: cast_nullable_to_non_nullable
as List<BoardShortModel>,
  ));
}


}


/// @nodoc
mixin _$BoardShortModel {

 String get id; String get name; String? get description; String get projectId; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of BoardShortModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardShortModelCopyWith<BoardShortModel> get copyWith => _$BoardShortModelCopyWithImpl<BoardShortModel>(this as BoardShortModel, _$identity);

  /// Serializes this BoardShortModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardShortModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,projectId,createdAt,updatedAt);

@override
String toString() {
  return 'BoardShortModel(id: $id, name: $name, description: $description, projectId: $projectId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BoardShortModelCopyWith<$Res>  {
  factory $BoardShortModelCopyWith(BoardShortModel value, $Res Function(BoardShortModel) _then) = _$BoardShortModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String projectId, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$BoardShortModelCopyWithImpl<$Res>
    implements $BoardShortModelCopyWith<$Res> {
  _$BoardShortModelCopyWithImpl(this._self, this._then);

  final BoardShortModel _self;
  final $Res Function(BoardShortModel) _then;

/// Create a copy of BoardShortModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? projectId = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardShortModel].
extension BoardShortModelPatterns on BoardShortModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardShortModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardShortModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardShortModel value)  $default,){
final _that = this;
switch (_that) {
case _BoardShortModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardShortModel value)?  $default,){
final _that = this;
switch (_that) {
case _BoardShortModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String projectId,  DateTime createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardShortModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.projectId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String projectId,  DateTime createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BoardShortModel():
return $default(_that.id,_that.name,_that.description,_that.projectId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String projectId,  DateTime createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BoardShortModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.projectId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoardShortModel implements BoardShortModel {
  const _BoardShortModel({required this.id, required this.name, this.description, required this.projectId, required this.createdAt, this.updatedAt});
  factory _BoardShortModel.fromJson(Map<String, dynamic> json) => _$BoardShortModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String projectId;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of BoardShortModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardShortModelCopyWith<_BoardShortModel> get copyWith => __$BoardShortModelCopyWithImpl<_BoardShortModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardShortModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardShortModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,projectId,createdAt,updatedAt);

@override
String toString() {
  return 'BoardShortModel(id: $id, name: $name, description: $description, projectId: $projectId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BoardShortModelCopyWith<$Res> implements $BoardShortModelCopyWith<$Res> {
  factory _$BoardShortModelCopyWith(_BoardShortModel value, $Res Function(_BoardShortModel) _then) = __$BoardShortModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String projectId, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$BoardShortModelCopyWithImpl<$Res>
    implements _$BoardShortModelCopyWith<$Res> {
  __$BoardShortModelCopyWithImpl(this._self, this._then);

  final _BoardShortModel _self;
  final $Res Function(_BoardShortModel) _then;

/// Create a copy of BoardShortModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? projectId = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_BoardShortModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
