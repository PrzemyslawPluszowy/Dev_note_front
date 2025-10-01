// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reorderable_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReorderableList {

 List<ReorderableWorkspace> get workspaces;
/// Create a copy of ReorderableList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReorderableListCopyWith<ReorderableList> get copyWith => _$ReorderableListCopyWithImpl<ReorderableList>(this as ReorderableList, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderableList&&const DeepCollectionEquality().equals(other.workspaces, workspaces));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(workspaces));

@override
String toString() {
  return 'ReorderableList(workspaces: $workspaces)';
}


}

/// @nodoc
abstract mixin class $ReorderableListCopyWith<$Res>  {
  factory $ReorderableListCopyWith(ReorderableList value, $Res Function(ReorderableList) _then) = _$ReorderableListCopyWithImpl;
@useResult
$Res call({
 List<ReorderableWorkspace> workspaces
});




}
/// @nodoc
class _$ReorderableListCopyWithImpl<$Res>
    implements $ReorderableListCopyWith<$Res> {
  _$ReorderableListCopyWithImpl(this._self, this._then);

  final ReorderableList _self;
  final $Res Function(ReorderableList) _then;

/// Create a copy of ReorderableList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workspaces = null,}) {
  return _then(_self.copyWith(
workspaces: null == workspaces ? _self.workspaces : workspaces // ignore: cast_nullable_to_non_nullable
as List<ReorderableWorkspace>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReorderableList].
extension ReorderableListPatterns on ReorderableList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReorderableList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReorderableList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReorderableList value)  $default,){
final _that = this;
switch (_that) {
case _ReorderableList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReorderableList value)?  $default,){
final _that = this;
switch (_that) {
case _ReorderableList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ReorderableWorkspace> workspaces)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReorderableList() when $default != null:
return $default(_that.workspaces);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ReorderableWorkspace> workspaces)  $default,) {final _that = this;
switch (_that) {
case _ReorderableList():
return $default(_that.workspaces);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ReorderableWorkspace> workspaces)?  $default,) {final _that = this;
switch (_that) {
case _ReorderableList() when $default != null:
return $default(_that.workspaces);case _:
  return null;

}
}

}

/// @nodoc


class _ReorderableList implements ReorderableList {
  const _ReorderableList({final  List<ReorderableWorkspace> workspaces = const []}): _workspaces = workspaces;
  

 final  List<ReorderableWorkspace> _workspaces;
@override@JsonKey() List<ReorderableWorkspace> get workspaces {
  if (_workspaces is EqualUnmodifiableListView) return _workspaces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workspaces);
}


/// Create a copy of ReorderableList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderableListCopyWith<_ReorderableList> get copyWith => __$ReorderableListCopyWithImpl<_ReorderableList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderableList&&const DeepCollectionEquality().equals(other._workspaces, _workspaces));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_workspaces));

@override
String toString() {
  return 'ReorderableList(workspaces: $workspaces)';
}


}

/// @nodoc
abstract mixin class _$ReorderableListCopyWith<$Res> implements $ReorderableListCopyWith<$Res> {
  factory _$ReorderableListCopyWith(_ReorderableList value, $Res Function(_ReorderableList) _then) = __$ReorderableListCopyWithImpl;
@override @useResult
$Res call({
 List<ReorderableWorkspace> workspaces
});




}
/// @nodoc
class __$ReorderableListCopyWithImpl<$Res>
    implements _$ReorderableListCopyWith<$Res> {
  __$ReorderableListCopyWithImpl(this._self, this._then);

  final _ReorderableList _self;
  final $Res Function(_ReorderableList) _then;

/// Create a copy of ReorderableList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workspaces = null,}) {
  return _then(_ReorderableList(
workspaces: null == workspaces ? _self._workspaces : workspaces // ignore: cast_nullable_to_non_nullable
as List<ReorderableWorkspace>,
  ));
}


}

/// @nodoc
mixin _$ReorderableWorkspace {

 String get workspaceId; bool get isHide; bool get isExpanded; List<ReorderableProject> get projects;
/// Create a copy of ReorderableWorkspace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReorderableWorkspaceCopyWith<ReorderableWorkspace> get copyWith => _$ReorderableWorkspaceCopyWithImpl<ReorderableWorkspace>(this as ReorderableWorkspace, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderableWorkspace&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.isHide, isHide) || other.isHide == isHide)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&const DeepCollectionEquality().equals(other.projects, projects));
}


@override
int get hashCode => Object.hash(runtimeType,workspaceId,isHide,isExpanded,const DeepCollectionEquality().hash(projects));

@override
String toString() {
  return 'ReorderableWorkspace(workspaceId: $workspaceId, isHide: $isHide, isExpanded: $isExpanded, projects: $projects)';
}


}

/// @nodoc
abstract mixin class $ReorderableWorkspaceCopyWith<$Res>  {
  factory $ReorderableWorkspaceCopyWith(ReorderableWorkspace value, $Res Function(ReorderableWorkspace) _then) = _$ReorderableWorkspaceCopyWithImpl;
@useResult
$Res call({
 String workspaceId, bool isHide, bool isExpanded, List<ReorderableProject> projects
});




}
/// @nodoc
class _$ReorderableWorkspaceCopyWithImpl<$Res>
    implements $ReorderableWorkspaceCopyWith<$Res> {
  _$ReorderableWorkspaceCopyWithImpl(this._self, this._then);

  final ReorderableWorkspace _self;
  final $Res Function(ReorderableWorkspace) _then;

/// Create a copy of ReorderableWorkspace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workspaceId = null,Object? isHide = null,Object? isExpanded = null,Object? projects = null,}) {
  return _then(_self.copyWith(
workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,isHide: null == isHide ? _self.isHide : isHide // ignore: cast_nullable_to_non_nullable
as bool,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<ReorderableProject>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReorderableWorkspace].
extension ReorderableWorkspacePatterns on ReorderableWorkspace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReorderableWorkspace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReorderableWorkspace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReorderableWorkspace value)  $default,){
final _that = this;
switch (_that) {
case _ReorderableWorkspace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReorderableWorkspace value)?  $default,){
final _that = this;
switch (_that) {
case _ReorderableWorkspace() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String workspaceId,  bool isHide,  bool isExpanded,  List<ReorderableProject> projects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReorderableWorkspace() when $default != null:
return $default(_that.workspaceId,_that.isHide,_that.isExpanded,_that.projects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String workspaceId,  bool isHide,  bool isExpanded,  List<ReorderableProject> projects)  $default,) {final _that = this;
switch (_that) {
case _ReorderableWorkspace():
return $default(_that.workspaceId,_that.isHide,_that.isExpanded,_that.projects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String workspaceId,  bool isHide,  bool isExpanded,  List<ReorderableProject> projects)?  $default,) {final _that = this;
switch (_that) {
case _ReorderableWorkspace() when $default != null:
return $default(_that.workspaceId,_that.isHide,_that.isExpanded,_that.projects);case _:
  return null;

}
}

}

/// @nodoc


class _ReorderableWorkspace implements ReorderableWorkspace {
  const _ReorderableWorkspace({required this.workspaceId, this.isHide = false, this.isExpanded = false, final  List<ReorderableProject> projects = const []}): _projects = projects;
  

@override final  String workspaceId;
@override@JsonKey() final  bool isHide;
@override@JsonKey() final  bool isExpanded;
 final  List<ReorderableProject> _projects;
@override@JsonKey() List<ReorderableProject> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}


/// Create a copy of ReorderableWorkspace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderableWorkspaceCopyWith<_ReorderableWorkspace> get copyWith => __$ReorderableWorkspaceCopyWithImpl<_ReorderableWorkspace>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderableWorkspace&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.isHide, isHide) || other.isHide == isHide)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&const DeepCollectionEquality().equals(other._projects, _projects));
}


@override
int get hashCode => Object.hash(runtimeType,workspaceId,isHide,isExpanded,const DeepCollectionEquality().hash(_projects));

@override
String toString() {
  return 'ReorderableWorkspace(workspaceId: $workspaceId, isHide: $isHide, isExpanded: $isExpanded, projects: $projects)';
}


}

/// @nodoc
abstract mixin class _$ReorderableWorkspaceCopyWith<$Res> implements $ReorderableWorkspaceCopyWith<$Res> {
  factory _$ReorderableWorkspaceCopyWith(_ReorderableWorkspace value, $Res Function(_ReorderableWorkspace) _then) = __$ReorderableWorkspaceCopyWithImpl;
@override @useResult
$Res call({
 String workspaceId, bool isHide, bool isExpanded, List<ReorderableProject> projects
});




}
/// @nodoc
class __$ReorderableWorkspaceCopyWithImpl<$Res>
    implements _$ReorderableWorkspaceCopyWith<$Res> {
  __$ReorderableWorkspaceCopyWithImpl(this._self, this._then);

  final _ReorderableWorkspace _self;
  final $Res Function(_ReorderableWorkspace) _then;

/// Create a copy of ReorderableWorkspace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workspaceId = null,Object? isHide = null,Object? isExpanded = null,Object? projects = null,}) {
  return _then(_ReorderableWorkspace(
workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,isHide: null == isHide ? _self.isHide : isHide // ignore: cast_nullable_to_non_nullable
as bool,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ReorderableProject>,
  ));
}


}

/// @nodoc
mixin _$ReorderableProject {

 String get projectId; bool get isHide; bool get isExpanded; List<ReorderableBoard> get boards;
/// Create a copy of ReorderableProject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReorderableProjectCopyWith<ReorderableProject> get copyWith => _$ReorderableProjectCopyWithImpl<ReorderableProject>(this as ReorderableProject, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderableProject&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.isHide, isHide) || other.isHide == isHide)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&const DeepCollectionEquality().equals(other.boards, boards));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,isHide,isExpanded,const DeepCollectionEquality().hash(boards));

@override
String toString() {
  return 'ReorderableProject(projectId: $projectId, isHide: $isHide, isExpanded: $isExpanded, boards: $boards)';
}


}

/// @nodoc
abstract mixin class $ReorderableProjectCopyWith<$Res>  {
  factory $ReorderableProjectCopyWith(ReorderableProject value, $Res Function(ReorderableProject) _then) = _$ReorderableProjectCopyWithImpl;
@useResult
$Res call({
 String projectId, bool isHide, bool isExpanded, List<ReorderableBoard> boards
});




}
/// @nodoc
class _$ReorderableProjectCopyWithImpl<$Res>
    implements $ReorderableProjectCopyWith<$Res> {
  _$ReorderableProjectCopyWithImpl(this._self, this._then);

  final ReorderableProject _self;
  final $Res Function(ReorderableProject) _then;

/// Create a copy of ReorderableProject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectId = null,Object? isHide = null,Object? isExpanded = null,Object? boards = null,}) {
  return _then(_self.copyWith(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,isHide: null == isHide ? _self.isHide : isHide // ignore: cast_nullable_to_non_nullable
as bool,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,boards: null == boards ? _self.boards : boards // ignore: cast_nullable_to_non_nullable
as List<ReorderableBoard>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReorderableProject].
extension ReorderableProjectPatterns on ReorderableProject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReorderableProject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReorderableProject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReorderableProject value)  $default,){
final _that = this;
switch (_that) {
case _ReorderableProject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReorderableProject value)?  $default,){
final _that = this;
switch (_that) {
case _ReorderableProject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String projectId,  bool isHide,  bool isExpanded,  List<ReorderableBoard> boards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReorderableProject() when $default != null:
return $default(_that.projectId,_that.isHide,_that.isExpanded,_that.boards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String projectId,  bool isHide,  bool isExpanded,  List<ReorderableBoard> boards)  $default,) {final _that = this;
switch (_that) {
case _ReorderableProject():
return $default(_that.projectId,_that.isHide,_that.isExpanded,_that.boards);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String projectId,  bool isHide,  bool isExpanded,  List<ReorderableBoard> boards)?  $default,) {final _that = this;
switch (_that) {
case _ReorderableProject() when $default != null:
return $default(_that.projectId,_that.isHide,_that.isExpanded,_that.boards);case _:
  return null;

}
}

}

/// @nodoc


class _ReorderableProject implements ReorderableProject {
  const _ReorderableProject({required this.projectId, this.isHide = false, this.isExpanded = false, final  List<ReorderableBoard> boards = const []}): _boards = boards;
  

@override final  String projectId;
@override@JsonKey() final  bool isHide;
@override@JsonKey() final  bool isExpanded;
 final  List<ReorderableBoard> _boards;
@override@JsonKey() List<ReorderableBoard> get boards {
  if (_boards is EqualUnmodifiableListView) return _boards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_boards);
}


/// Create a copy of ReorderableProject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderableProjectCopyWith<_ReorderableProject> get copyWith => __$ReorderableProjectCopyWithImpl<_ReorderableProject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderableProject&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.isHide, isHide) || other.isHide == isHide)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&const DeepCollectionEquality().equals(other._boards, _boards));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,isHide,isExpanded,const DeepCollectionEquality().hash(_boards));

@override
String toString() {
  return 'ReorderableProject(projectId: $projectId, isHide: $isHide, isExpanded: $isExpanded, boards: $boards)';
}


}

/// @nodoc
abstract mixin class _$ReorderableProjectCopyWith<$Res> implements $ReorderableProjectCopyWith<$Res> {
  factory _$ReorderableProjectCopyWith(_ReorderableProject value, $Res Function(_ReorderableProject) _then) = __$ReorderableProjectCopyWithImpl;
@override @useResult
$Res call({
 String projectId, bool isHide, bool isExpanded, List<ReorderableBoard> boards
});




}
/// @nodoc
class __$ReorderableProjectCopyWithImpl<$Res>
    implements _$ReorderableProjectCopyWith<$Res> {
  __$ReorderableProjectCopyWithImpl(this._self, this._then);

  final _ReorderableProject _self;
  final $Res Function(_ReorderableProject) _then;

/// Create a copy of ReorderableProject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? isHide = null,Object? isExpanded = null,Object? boards = null,}) {
  return _then(_ReorderableProject(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,isHide: null == isHide ? _self.isHide : isHide // ignore: cast_nullable_to_non_nullable
as bool,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,boards: null == boards ? _self._boards : boards // ignore: cast_nullable_to_non_nullable
as List<ReorderableBoard>,
  ));
}


}

/// @nodoc
mixin _$ReorderableBoard {

 String get boardId; bool get isHide;
/// Create a copy of ReorderableBoard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReorderableBoardCopyWith<ReorderableBoard> get copyWith => _$ReorderableBoardCopyWithImpl<ReorderableBoard>(this as ReorderableBoard, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderableBoard&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.isHide, isHide) || other.isHide == isHide));
}


@override
int get hashCode => Object.hash(runtimeType,boardId,isHide);

@override
String toString() {
  return 'ReorderableBoard(boardId: $boardId, isHide: $isHide)';
}


}

/// @nodoc
abstract mixin class $ReorderableBoardCopyWith<$Res>  {
  factory $ReorderableBoardCopyWith(ReorderableBoard value, $Res Function(ReorderableBoard) _then) = _$ReorderableBoardCopyWithImpl;
@useResult
$Res call({
 String boardId, bool isHide
});




}
/// @nodoc
class _$ReorderableBoardCopyWithImpl<$Res>
    implements $ReorderableBoardCopyWith<$Res> {
  _$ReorderableBoardCopyWithImpl(this._self, this._then);

  final ReorderableBoard _self;
  final $Res Function(ReorderableBoard) _then;

/// Create a copy of ReorderableBoard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? boardId = null,Object? isHide = null,}) {
  return _then(_self.copyWith(
boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as String,isHide: null == isHide ? _self.isHide : isHide // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReorderableBoard].
extension ReorderableBoardPatterns on ReorderableBoard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReorderableBoard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReorderableBoard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReorderableBoard value)  $default,){
final _that = this;
switch (_that) {
case _ReorderableBoard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReorderableBoard value)?  $default,){
final _that = this;
switch (_that) {
case _ReorderableBoard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String boardId,  bool isHide)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReorderableBoard() when $default != null:
return $default(_that.boardId,_that.isHide);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String boardId,  bool isHide)  $default,) {final _that = this;
switch (_that) {
case _ReorderableBoard():
return $default(_that.boardId,_that.isHide);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String boardId,  bool isHide)?  $default,) {final _that = this;
switch (_that) {
case _ReorderableBoard() when $default != null:
return $default(_that.boardId,_that.isHide);case _:
  return null;

}
}

}

/// @nodoc


class _ReorderableBoard implements ReorderableBoard {
  const _ReorderableBoard({required this.boardId, this.isHide = false});
  

@override final  String boardId;
@override@JsonKey() final  bool isHide;

/// Create a copy of ReorderableBoard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderableBoardCopyWith<_ReorderableBoard> get copyWith => __$ReorderableBoardCopyWithImpl<_ReorderableBoard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderableBoard&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.isHide, isHide) || other.isHide == isHide));
}


@override
int get hashCode => Object.hash(runtimeType,boardId,isHide);

@override
String toString() {
  return 'ReorderableBoard(boardId: $boardId, isHide: $isHide)';
}


}

/// @nodoc
abstract mixin class _$ReorderableBoardCopyWith<$Res> implements $ReorderableBoardCopyWith<$Res> {
  factory _$ReorderableBoardCopyWith(_ReorderableBoard value, $Res Function(_ReorderableBoard) _then) = __$ReorderableBoardCopyWithImpl;
@override @useResult
$Res call({
 String boardId, bool isHide
});




}
/// @nodoc
class __$ReorderableBoardCopyWithImpl<$Res>
    implements _$ReorderableBoardCopyWith<$Res> {
  __$ReorderableBoardCopyWithImpl(this._self, this._then);

  final _ReorderableBoard _self;
  final $Res Function(_ReorderableBoard) _then;

/// Create a copy of ReorderableBoard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? boardId = null,Object? isHide = null,}) {
  return _then(_ReorderableBoard(
boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as String,isHide: null == isHide ? _self.isHide : isHide // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
