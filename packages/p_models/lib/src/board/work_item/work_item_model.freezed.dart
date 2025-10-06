// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkItemModel {

 String get id; String get title; String? get description; String get categoryId; String get boardId; String? get parentWorkItemId; int get order; DateTime get createdAt; DateTime? get updatedAt; DateTime? get startDate; DateTime? get endDate; DateTime? get dueDate; String? get assignedUserId; String? get assignedUserName; String? get ownerId; String? get ownerName; String? get observerIds; List<WorkItemFieldValueModel> get fieldValues; List<WorkItemModel> get subWorkItems;
/// Create a copy of WorkItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkItemModelCopyWith<WorkItemModel> get copyWith => _$WorkItemModelCopyWithImpl<WorkItemModel>(this as WorkItemModel, _$identity);

  /// Serializes this WorkItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.parentWorkItemId, parentWorkItemId) || other.parentWorkItemId == parentWorkItemId)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.assignedUserId, assignedUserId) || other.assignedUserId == assignedUserId)&&(identical(other.assignedUserName, assignedUserName) || other.assignedUserName == assignedUserName)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.observerIds, observerIds) || other.observerIds == observerIds)&&const DeepCollectionEquality().equals(other.fieldValues, fieldValues)&&const DeepCollectionEquality().equals(other.subWorkItems, subWorkItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,categoryId,boardId,parentWorkItemId,order,createdAt,updatedAt,startDate,endDate,dueDate,assignedUserId,assignedUserName,ownerId,ownerName,observerIds,const DeepCollectionEquality().hash(fieldValues),const DeepCollectionEquality().hash(subWorkItems)]);

@override
String toString() {
  return 'WorkItemModel(id: $id, title: $title, description: $description, categoryId: $categoryId, boardId: $boardId, parentWorkItemId: $parentWorkItemId, order: $order, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, endDate: $endDate, dueDate: $dueDate, assignedUserId: $assignedUserId, assignedUserName: $assignedUserName, ownerId: $ownerId, ownerName: $ownerName, observerIds: $observerIds, fieldValues: $fieldValues, subWorkItems: $subWorkItems)';
}


}

/// @nodoc
abstract mixin class $WorkItemModelCopyWith<$Res>  {
  factory $WorkItemModelCopyWith(WorkItemModel value, $Res Function(WorkItemModel) _then) = _$WorkItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, String categoryId, String boardId, String? parentWorkItemId, int order, DateTime createdAt, DateTime? updatedAt, DateTime? startDate, DateTime? endDate, DateTime? dueDate, String? assignedUserId, String? assignedUserName, String? ownerId, String? ownerName, String? observerIds, List<WorkItemFieldValueModel> fieldValues, List<WorkItemModel> subWorkItems
});




}
/// @nodoc
class _$WorkItemModelCopyWithImpl<$Res>
    implements $WorkItemModelCopyWith<$Res> {
  _$WorkItemModelCopyWithImpl(this._self, this._then);

  final WorkItemModel _self;
  final $Res Function(WorkItemModel) _then;

/// Create a copy of WorkItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? categoryId = null,Object? boardId = null,Object? parentWorkItemId = freezed,Object? order = null,Object? createdAt = null,Object? updatedAt = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? dueDate = freezed,Object? assignedUserId = freezed,Object? assignedUserName = freezed,Object? ownerId = freezed,Object? ownerName = freezed,Object? observerIds = freezed,Object? fieldValues = null,Object? subWorkItems = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as String,parentWorkItemId: freezed == parentWorkItemId ? _self.parentWorkItemId : parentWorkItemId // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,assignedUserId: freezed == assignedUserId ? _self.assignedUserId : assignedUserId // ignore: cast_nullable_to_non_nullable
as String?,assignedUserName: freezed == assignedUserName ? _self.assignedUserName : assignedUserName // ignore: cast_nullable_to_non_nullable
as String?,ownerId: freezed == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String?,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,observerIds: freezed == observerIds ? _self.observerIds : observerIds // ignore: cast_nullable_to_non_nullable
as String?,fieldValues: null == fieldValues ? _self.fieldValues : fieldValues // ignore: cast_nullable_to_non_nullable
as List<WorkItemFieldValueModel>,subWorkItems: null == subWorkItems ? _self.subWorkItems : subWorkItems // ignore: cast_nullable_to_non_nullable
as List<WorkItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkItemModel].
extension WorkItemModelPatterns on WorkItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkItemModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String categoryId,  String boardId,  String? parentWorkItemId,  int order,  DateTime createdAt,  DateTime? updatedAt,  DateTime? startDate,  DateTime? endDate,  DateTime? dueDate,  String? assignedUserId,  String? assignedUserName,  String? ownerId,  String? ownerName,  String? observerIds,  List<WorkItemFieldValueModel> fieldValues,  List<WorkItemModel> subWorkItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkItemModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.categoryId,_that.boardId,_that.parentWorkItemId,_that.order,_that.createdAt,_that.updatedAt,_that.startDate,_that.endDate,_that.dueDate,_that.assignedUserId,_that.assignedUserName,_that.ownerId,_that.ownerName,_that.observerIds,_that.fieldValues,_that.subWorkItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String categoryId,  String boardId,  String? parentWorkItemId,  int order,  DateTime createdAt,  DateTime? updatedAt,  DateTime? startDate,  DateTime? endDate,  DateTime? dueDate,  String? assignedUserId,  String? assignedUserName,  String? ownerId,  String? ownerName,  String? observerIds,  List<WorkItemFieldValueModel> fieldValues,  List<WorkItemModel> subWorkItems)  $default,) {final _that = this;
switch (_that) {
case _WorkItemModel():
return $default(_that.id,_that.title,_that.description,_that.categoryId,_that.boardId,_that.parentWorkItemId,_that.order,_that.createdAt,_that.updatedAt,_that.startDate,_that.endDate,_that.dueDate,_that.assignedUserId,_that.assignedUserName,_that.ownerId,_that.ownerName,_that.observerIds,_that.fieldValues,_that.subWorkItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  String categoryId,  String boardId,  String? parentWorkItemId,  int order,  DateTime createdAt,  DateTime? updatedAt,  DateTime? startDate,  DateTime? endDate,  DateTime? dueDate,  String? assignedUserId,  String? assignedUserName,  String? ownerId,  String? ownerName,  String? observerIds,  List<WorkItemFieldValueModel> fieldValues,  List<WorkItemModel> subWorkItems)?  $default,) {final _that = this;
switch (_that) {
case _WorkItemModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.categoryId,_that.boardId,_that.parentWorkItemId,_that.order,_that.createdAt,_that.updatedAt,_that.startDate,_that.endDate,_that.dueDate,_that.assignedUserId,_that.assignedUserName,_that.ownerId,_that.ownerName,_that.observerIds,_that.fieldValues,_that.subWorkItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkItemModel implements WorkItemModel {
  const _WorkItemModel({required this.id, required this.title, this.description, required this.categoryId, required this.boardId, this.parentWorkItemId, required this.order, required this.createdAt, this.updatedAt, this.startDate, this.endDate, this.dueDate, this.assignedUserId, this.assignedUserName, this.ownerId, this.ownerName, this.observerIds, final  List<WorkItemFieldValueModel> fieldValues = const [], final  List<WorkItemModel> subWorkItems = const []}): _fieldValues = fieldValues,_subWorkItems = subWorkItems;
  factory _WorkItemModel.fromJson(Map<String, dynamic> json) => _$WorkItemModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override final  String categoryId;
@override final  String boardId;
@override final  String? parentWorkItemId;
@override final  int order;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  DateTime? dueDate;
@override final  String? assignedUserId;
@override final  String? assignedUserName;
@override final  String? ownerId;
@override final  String? ownerName;
@override final  String? observerIds;
 final  List<WorkItemFieldValueModel> _fieldValues;
@override@JsonKey() List<WorkItemFieldValueModel> get fieldValues {
  if (_fieldValues is EqualUnmodifiableListView) return _fieldValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fieldValues);
}

 final  List<WorkItemModel> _subWorkItems;
@override@JsonKey() List<WorkItemModel> get subWorkItems {
  if (_subWorkItems is EqualUnmodifiableListView) return _subWorkItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subWorkItems);
}


/// Create a copy of WorkItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkItemModelCopyWith<_WorkItemModel> get copyWith => __$WorkItemModelCopyWithImpl<_WorkItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.parentWorkItemId, parentWorkItemId) || other.parentWorkItemId == parentWorkItemId)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.assignedUserId, assignedUserId) || other.assignedUserId == assignedUserId)&&(identical(other.assignedUserName, assignedUserName) || other.assignedUserName == assignedUserName)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.observerIds, observerIds) || other.observerIds == observerIds)&&const DeepCollectionEquality().equals(other._fieldValues, _fieldValues)&&const DeepCollectionEquality().equals(other._subWorkItems, _subWorkItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,categoryId,boardId,parentWorkItemId,order,createdAt,updatedAt,startDate,endDate,dueDate,assignedUserId,assignedUserName,ownerId,ownerName,observerIds,const DeepCollectionEquality().hash(_fieldValues),const DeepCollectionEquality().hash(_subWorkItems)]);

@override
String toString() {
  return 'WorkItemModel(id: $id, title: $title, description: $description, categoryId: $categoryId, boardId: $boardId, parentWorkItemId: $parentWorkItemId, order: $order, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, endDate: $endDate, dueDate: $dueDate, assignedUserId: $assignedUserId, assignedUserName: $assignedUserName, ownerId: $ownerId, ownerName: $ownerName, observerIds: $observerIds, fieldValues: $fieldValues, subWorkItems: $subWorkItems)';
}


}

/// @nodoc
abstract mixin class _$WorkItemModelCopyWith<$Res> implements $WorkItemModelCopyWith<$Res> {
  factory _$WorkItemModelCopyWith(_WorkItemModel value, $Res Function(_WorkItemModel) _then) = __$WorkItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, String categoryId, String boardId, String? parentWorkItemId, int order, DateTime createdAt, DateTime? updatedAt, DateTime? startDate, DateTime? endDate, DateTime? dueDate, String? assignedUserId, String? assignedUserName, String? ownerId, String? ownerName, String? observerIds, List<WorkItemFieldValueModel> fieldValues, List<WorkItemModel> subWorkItems
});




}
/// @nodoc
class __$WorkItemModelCopyWithImpl<$Res>
    implements _$WorkItemModelCopyWith<$Res> {
  __$WorkItemModelCopyWithImpl(this._self, this._then);

  final _WorkItemModel _self;
  final $Res Function(_WorkItemModel) _then;

/// Create a copy of WorkItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? categoryId = null,Object? boardId = null,Object? parentWorkItemId = freezed,Object? order = null,Object? createdAt = null,Object? updatedAt = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? dueDate = freezed,Object? assignedUserId = freezed,Object? assignedUserName = freezed,Object? ownerId = freezed,Object? ownerName = freezed,Object? observerIds = freezed,Object? fieldValues = null,Object? subWorkItems = null,}) {
  return _then(_WorkItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as String,parentWorkItemId: freezed == parentWorkItemId ? _self.parentWorkItemId : parentWorkItemId // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,assignedUserId: freezed == assignedUserId ? _self.assignedUserId : assignedUserId // ignore: cast_nullable_to_non_nullable
as String?,assignedUserName: freezed == assignedUserName ? _self.assignedUserName : assignedUserName // ignore: cast_nullable_to_non_nullable
as String?,ownerId: freezed == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String?,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,observerIds: freezed == observerIds ? _self.observerIds : observerIds // ignore: cast_nullable_to_non_nullable
as String?,fieldValues: null == fieldValues ? _self._fieldValues : fieldValues // ignore: cast_nullable_to_non_nullable
as List<WorkItemFieldValueModel>,subWorkItems: null == subWorkItems ? _self._subWorkItems : subWorkItems // ignore: cast_nullable_to_non_nullable
as List<WorkItemModel>,
  ));
}


}


/// @nodoc
mixin _$WorkItemFieldValueModel {

 String get id; String? get value; DateTime get updatedAt; String get workItemId; String get fieldDefinitionId;
/// Create a copy of WorkItemFieldValueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkItemFieldValueModelCopyWith<WorkItemFieldValueModel> get copyWith => _$WorkItemFieldValueModelCopyWithImpl<WorkItemFieldValueModel>(this as WorkItemFieldValueModel, _$identity);

  /// Serializes this WorkItemFieldValueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkItemFieldValueModel&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.workItemId, workItemId) || other.workItemId == workItemId)&&(identical(other.fieldDefinitionId, fieldDefinitionId) || other.fieldDefinitionId == fieldDefinitionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value,updatedAt,workItemId,fieldDefinitionId);

@override
String toString() {
  return 'WorkItemFieldValueModel(id: $id, value: $value, updatedAt: $updatedAt, workItemId: $workItemId, fieldDefinitionId: $fieldDefinitionId)';
}


}

/// @nodoc
abstract mixin class $WorkItemFieldValueModelCopyWith<$Res>  {
  factory $WorkItemFieldValueModelCopyWith(WorkItemFieldValueModel value, $Res Function(WorkItemFieldValueModel) _then) = _$WorkItemFieldValueModelCopyWithImpl;
@useResult
$Res call({
 String id, String? value, DateTime updatedAt, String workItemId, String fieldDefinitionId
});




}
/// @nodoc
class _$WorkItemFieldValueModelCopyWithImpl<$Res>
    implements $WorkItemFieldValueModelCopyWith<$Res> {
  _$WorkItemFieldValueModelCopyWithImpl(this._self, this._then);

  final WorkItemFieldValueModel _self;
  final $Res Function(WorkItemFieldValueModel) _then;

/// Create a copy of WorkItemFieldValueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? value = freezed,Object? updatedAt = null,Object? workItemId = null,Object? fieldDefinitionId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,workItemId: null == workItemId ? _self.workItemId : workItemId // ignore: cast_nullable_to_non_nullable
as String,fieldDefinitionId: null == fieldDefinitionId ? _self.fieldDefinitionId : fieldDefinitionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkItemFieldValueModel].
extension WorkItemFieldValueModelPatterns on WorkItemFieldValueModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkItemFieldValueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkItemFieldValueModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkItemFieldValueModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkItemFieldValueModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkItemFieldValueModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkItemFieldValueModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? value,  DateTime updatedAt,  String workItemId,  String fieldDefinitionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkItemFieldValueModel() when $default != null:
return $default(_that.id,_that.value,_that.updatedAt,_that.workItemId,_that.fieldDefinitionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? value,  DateTime updatedAt,  String workItemId,  String fieldDefinitionId)  $default,) {final _that = this;
switch (_that) {
case _WorkItemFieldValueModel():
return $default(_that.id,_that.value,_that.updatedAt,_that.workItemId,_that.fieldDefinitionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? value,  DateTime updatedAt,  String workItemId,  String fieldDefinitionId)?  $default,) {final _that = this;
switch (_that) {
case _WorkItemFieldValueModel() when $default != null:
return $default(_that.id,_that.value,_that.updatedAt,_that.workItemId,_that.fieldDefinitionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkItemFieldValueModel implements WorkItemFieldValueModel {
  const _WorkItemFieldValueModel({required this.id, this.value, required this.updatedAt, required this.workItemId, required this.fieldDefinitionId});
  factory _WorkItemFieldValueModel.fromJson(Map<String, dynamic> json) => _$WorkItemFieldValueModelFromJson(json);

@override final  String id;
@override final  String? value;
@override final  DateTime updatedAt;
@override final  String workItemId;
@override final  String fieldDefinitionId;

/// Create a copy of WorkItemFieldValueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkItemFieldValueModelCopyWith<_WorkItemFieldValueModel> get copyWith => __$WorkItemFieldValueModelCopyWithImpl<_WorkItemFieldValueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkItemFieldValueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkItemFieldValueModel&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.workItemId, workItemId) || other.workItemId == workItemId)&&(identical(other.fieldDefinitionId, fieldDefinitionId) || other.fieldDefinitionId == fieldDefinitionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value,updatedAt,workItemId,fieldDefinitionId);

@override
String toString() {
  return 'WorkItemFieldValueModel(id: $id, value: $value, updatedAt: $updatedAt, workItemId: $workItemId, fieldDefinitionId: $fieldDefinitionId)';
}


}

/// @nodoc
abstract mixin class _$WorkItemFieldValueModelCopyWith<$Res> implements $WorkItemFieldValueModelCopyWith<$Res> {
  factory _$WorkItemFieldValueModelCopyWith(_WorkItemFieldValueModel value, $Res Function(_WorkItemFieldValueModel) _then) = __$WorkItemFieldValueModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? value, DateTime updatedAt, String workItemId, String fieldDefinitionId
});




}
/// @nodoc
class __$WorkItemFieldValueModelCopyWithImpl<$Res>
    implements _$WorkItemFieldValueModelCopyWith<$Res> {
  __$WorkItemFieldValueModelCopyWithImpl(this._self, this._then);

  final _WorkItemFieldValueModel _self;
  final $Res Function(_WorkItemFieldValueModel) _then;

/// Create a copy of WorkItemFieldValueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? value = freezed,Object? updatedAt = null,Object? workItemId = null,Object? fieldDefinitionId = null,}) {
  return _then(_WorkItemFieldValueModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,workItemId: null == workItemId ? _self.workItemId : workItemId // ignore: cast_nullable_to_non_nullable
as String,fieldDefinitionId: null == fieldDefinitionId ? _self.fieldDefinitionId : fieldDefinitionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
