// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileRecord {

 String get id; String get fileName; String get originalFileName; String get contentType; int get size; String get createdAt; String? get ownerId; String? get thumbnailUrl;
/// Create a copy of FileRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileRecordCopyWith<FileRecord> get copyWith => _$FileRecordCopyWithImpl<FileRecord>(this as FileRecord, _$identity);

  /// Serializes this FileRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.originalFileName, originalFileName) || other.originalFileName == originalFileName)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.size, size) || other.size == size)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileName,originalFileName,contentType,size,createdAt,ownerId,thumbnailUrl);

@override
String toString() {
  return 'FileRecord(id: $id, fileName: $fileName, originalFileName: $originalFileName, contentType: $contentType, size: $size, createdAt: $createdAt, ownerId: $ownerId, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $FileRecordCopyWith<$Res>  {
  factory $FileRecordCopyWith(FileRecord value, $Res Function(FileRecord) _then) = _$FileRecordCopyWithImpl;
@useResult
$Res call({
 String id, String fileName, String originalFileName, String contentType, int size, String createdAt, String? ownerId, String? thumbnailUrl
});




}
/// @nodoc
class _$FileRecordCopyWithImpl<$Res>
    implements $FileRecordCopyWith<$Res> {
  _$FileRecordCopyWithImpl(this._self, this._then);

  final FileRecord _self;
  final $Res Function(FileRecord) _then;

/// Create a copy of FileRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileName = null,Object? originalFileName = null,Object? contentType = null,Object? size = null,Object? createdAt = null,Object? ownerId = freezed,Object? thumbnailUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,originalFileName: null == originalFileName ? _self.originalFileName : originalFileName // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,ownerId: freezed == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FileRecord].
extension FileRecordPatterns on FileRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileRecord value)  $default,){
final _that = this;
switch (_that) {
case _FileRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileRecord value)?  $default,){
final _that = this;
switch (_that) {
case _FileRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fileName,  String originalFileName,  String contentType,  int size,  String createdAt,  String? ownerId,  String? thumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileRecord() when $default != null:
return $default(_that.id,_that.fileName,_that.originalFileName,_that.contentType,_that.size,_that.createdAt,_that.ownerId,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fileName,  String originalFileName,  String contentType,  int size,  String createdAt,  String? ownerId,  String? thumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _FileRecord():
return $default(_that.id,_that.fileName,_that.originalFileName,_that.contentType,_that.size,_that.createdAt,_that.ownerId,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fileName,  String originalFileName,  String contentType,  int size,  String createdAt,  String? ownerId,  String? thumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _FileRecord() when $default != null:
return $default(_that.id,_that.fileName,_that.originalFileName,_that.contentType,_that.size,_that.createdAt,_that.ownerId,_that.thumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FileRecord implements FileRecord {
  const _FileRecord({required this.id, required this.fileName, required this.originalFileName, required this.contentType, required this.size, required this.createdAt, this.ownerId, this.thumbnailUrl});
  factory _FileRecord.fromJson(Map<String, dynamic> json) => _$FileRecordFromJson(json);

@override final  String id;
@override final  String fileName;
@override final  String originalFileName;
@override final  String contentType;
@override final  int size;
@override final  String createdAt;
@override final  String? ownerId;
@override final  String? thumbnailUrl;

/// Create a copy of FileRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileRecordCopyWith<_FileRecord> get copyWith => __$FileRecordCopyWithImpl<_FileRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.originalFileName, originalFileName) || other.originalFileName == originalFileName)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.size, size) || other.size == size)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileName,originalFileName,contentType,size,createdAt,ownerId,thumbnailUrl);

@override
String toString() {
  return 'FileRecord(id: $id, fileName: $fileName, originalFileName: $originalFileName, contentType: $contentType, size: $size, createdAt: $createdAt, ownerId: $ownerId, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$FileRecordCopyWith<$Res> implements $FileRecordCopyWith<$Res> {
  factory _$FileRecordCopyWith(_FileRecord value, $Res Function(_FileRecord) _then) = __$FileRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String fileName, String originalFileName, String contentType, int size, String createdAt, String? ownerId, String? thumbnailUrl
});




}
/// @nodoc
class __$FileRecordCopyWithImpl<$Res>
    implements _$FileRecordCopyWith<$Res> {
  __$FileRecordCopyWithImpl(this._self, this._then);

  final _FileRecord _self;
  final $Res Function(_FileRecord) _then;

/// Create a copy of FileRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileName = null,Object? originalFileName = null,Object? contentType = null,Object? size = null,Object? createdAt = null,Object? ownerId = freezed,Object? thumbnailUrl = freezed,}) {
  return _then(_FileRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,originalFileName: null == originalFileName ? _self.originalFileName : originalFileName // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,ownerId: freezed == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
