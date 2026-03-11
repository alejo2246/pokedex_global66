// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonDetailResponse {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'types') List<PokemonTypeSlot> get types;
/// Create a copy of PokemonDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonDetailResponseCopyWith<PokemonDetailResponse> get copyWith => _$PokemonDetailResponseCopyWithImpl<PokemonDetailResponse>(this as PokemonDetailResponse, _$identity);

  /// Serializes this PokemonDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.types, types));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(types));

@override
String toString() {
  return 'PokemonDetailResponse(id: $id, name: $name, types: $types)';
}


}

/// @nodoc
abstract mixin class $PokemonDetailResponseCopyWith<$Res>  {
  factory $PokemonDetailResponseCopyWith(PokemonDetailResponse value, $Res Function(PokemonDetailResponse) _then) = _$PokemonDetailResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'types') List<PokemonTypeSlot> types
});




}
/// @nodoc
class _$PokemonDetailResponseCopyWithImpl<$Res>
    implements $PokemonDetailResponseCopyWith<$Res> {
  _$PokemonDetailResponseCopyWithImpl(this._self, this._then);

  final PokemonDetailResponse _self;
  final $Res Function(PokemonDetailResponse) _then;

/// Create a copy of PokemonDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? types = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<PokemonTypeSlot>,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonDetailResponse].
extension PokemonDetailResponsePatterns on PokemonDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _PokemonDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'types')  List<PokemonTypeSlot> types)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonDetailResponse() when $default != null:
return $default(_that.id,_that.name,_that.types);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'types')  List<PokemonTypeSlot> types)  $default,) {final _that = this;
switch (_that) {
case _PokemonDetailResponse():
return $default(_that.id,_that.name,_that.types);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'types')  List<PokemonTypeSlot> types)?  $default,) {final _that = this;
switch (_that) {
case _PokemonDetailResponse() when $default != null:
return $default(_that.id,_that.name,_that.types);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonDetailResponse implements PokemonDetailResponse {
  const _PokemonDetailResponse({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'types') required final  List<PokemonTypeSlot> types}): _types = types;
  factory _PokemonDetailResponse.fromJson(Map<String, dynamic> json) => _$PokemonDetailResponseFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
 final  List<PokemonTypeSlot> _types;
@override@JsonKey(name: 'types') List<PokemonTypeSlot> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}


/// Create a copy of PokemonDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonDetailResponseCopyWith<_PokemonDetailResponse> get copyWith => __$PokemonDetailResponseCopyWithImpl<_PokemonDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._types, _types));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_types));

@override
String toString() {
  return 'PokemonDetailResponse(id: $id, name: $name, types: $types)';
}


}

/// @nodoc
abstract mixin class _$PokemonDetailResponseCopyWith<$Res> implements $PokemonDetailResponseCopyWith<$Res> {
  factory _$PokemonDetailResponseCopyWith(_PokemonDetailResponse value, $Res Function(_PokemonDetailResponse) _then) = __$PokemonDetailResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'types') List<PokemonTypeSlot> types
});




}
/// @nodoc
class __$PokemonDetailResponseCopyWithImpl<$Res>
    implements _$PokemonDetailResponseCopyWith<$Res> {
  __$PokemonDetailResponseCopyWithImpl(this._self, this._then);

  final _PokemonDetailResponse _self;
  final $Res Function(_PokemonDetailResponse) _then;

/// Create a copy of PokemonDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? types = null,}) {
  return _then(_PokemonDetailResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<PokemonTypeSlot>,
  ));
}


}


/// @nodoc
mixin _$PokemonTypeSlot {

@JsonKey(name: 'slot') int get slot;@JsonKey(name: 'type') PokemonTypeInfo get type;
/// Create a copy of PokemonTypeSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonTypeSlotCopyWith<PokemonTypeSlot> get copyWith => _$PokemonTypeSlotCopyWithImpl<PokemonTypeSlot>(this as PokemonTypeSlot, _$identity);

  /// Serializes this PokemonTypeSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonTypeSlot&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slot,type);

@override
String toString() {
  return 'PokemonTypeSlot(slot: $slot, type: $type)';
}


}

/// @nodoc
abstract mixin class $PokemonTypeSlotCopyWith<$Res>  {
  factory $PokemonTypeSlotCopyWith(PokemonTypeSlot value, $Res Function(PokemonTypeSlot) _then) = _$PokemonTypeSlotCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'slot') int slot,@JsonKey(name: 'type') PokemonTypeInfo type
});


$PokemonTypeInfoCopyWith<$Res> get type;

}
/// @nodoc
class _$PokemonTypeSlotCopyWithImpl<$Res>
    implements $PokemonTypeSlotCopyWith<$Res> {
  _$PokemonTypeSlotCopyWithImpl(this._self, this._then);

  final PokemonTypeSlot _self;
  final $Res Function(PokemonTypeSlot) _then;

/// Create a copy of PokemonTypeSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slot = null,Object? type = null,}) {
  return _then(_self.copyWith(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PokemonTypeInfo,
  ));
}
/// Create a copy of PokemonTypeSlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonTypeInfoCopyWith<$Res> get type {
  
  return $PokemonTypeInfoCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonTypeSlot].
extension PokemonTypeSlotPatterns on PokemonTypeSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonTypeSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonTypeSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonTypeSlot value)  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonTypeSlot value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'slot')  int slot, @JsonKey(name: 'type')  PokemonTypeInfo type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonTypeSlot() when $default != null:
return $default(_that.slot,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'slot')  int slot, @JsonKey(name: 'type')  PokemonTypeInfo type)  $default,) {final _that = this;
switch (_that) {
case _PokemonTypeSlot():
return $default(_that.slot,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'slot')  int slot, @JsonKey(name: 'type')  PokemonTypeInfo type)?  $default,) {final _that = this;
switch (_that) {
case _PokemonTypeSlot() when $default != null:
return $default(_that.slot,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonTypeSlot implements PokemonTypeSlot {
  const _PokemonTypeSlot({@JsonKey(name: 'slot') required this.slot, @JsonKey(name: 'type') required this.type});
  factory _PokemonTypeSlot.fromJson(Map<String, dynamic> json) => _$PokemonTypeSlotFromJson(json);

@override@JsonKey(name: 'slot') final  int slot;
@override@JsonKey(name: 'type') final  PokemonTypeInfo type;

/// Create a copy of PokemonTypeSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonTypeSlotCopyWith<_PokemonTypeSlot> get copyWith => __$PokemonTypeSlotCopyWithImpl<_PokemonTypeSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonTypeSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonTypeSlot&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slot,type);

@override
String toString() {
  return 'PokemonTypeSlot(slot: $slot, type: $type)';
}


}

/// @nodoc
abstract mixin class _$PokemonTypeSlotCopyWith<$Res> implements $PokemonTypeSlotCopyWith<$Res> {
  factory _$PokemonTypeSlotCopyWith(_PokemonTypeSlot value, $Res Function(_PokemonTypeSlot) _then) = __$PokemonTypeSlotCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'slot') int slot,@JsonKey(name: 'type') PokemonTypeInfo type
});


@override $PokemonTypeInfoCopyWith<$Res> get type;

}
/// @nodoc
class __$PokemonTypeSlotCopyWithImpl<$Res>
    implements _$PokemonTypeSlotCopyWith<$Res> {
  __$PokemonTypeSlotCopyWithImpl(this._self, this._then);

  final _PokemonTypeSlot _self;
  final $Res Function(_PokemonTypeSlot) _then;

/// Create a copy of PokemonTypeSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slot = null,Object? type = null,}) {
  return _then(_PokemonTypeSlot(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PokemonTypeInfo,
  ));
}

/// Create a copy of PokemonTypeSlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonTypeInfoCopyWith<$Res> get type {
  
  return $PokemonTypeInfoCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// @nodoc
mixin _$PokemonTypeInfo {

@JsonKey(name: 'name') String get name;
/// Create a copy of PokemonTypeInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonTypeInfoCopyWith<PokemonTypeInfo> get copyWith => _$PokemonTypeInfoCopyWithImpl<PokemonTypeInfo>(this as PokemonTypeInfo, _$identity);

  /// Serializes this PokemonTypeInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonTypeInfo&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'PokemonTypeInfo(name: $name)';
}


}

/// @nodoc
abstract mixin class $PokemonTypeInfoCopyWith<$Res>  {
  factory $PokemonTypeInfoCopyWith(PokemonTypeInfo value, $Res Function(PokemonTypeInfo) _then) = _$PokemonTypeInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String name
});




}
/// @nodoc
class _$PokemonTypeInfoCopyWithImpl<$Res>
    implements $PokemonTypeInfoCopyWith<$Res> {
  _$PokemonTypeInfoCopyWithImpl(this._self, this._then);

  final PokemonTypeInfo _self;
  final $Res Function(PokemonTypeInfo) _then;

/// Create a copy of PokemonTypeInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonTypeInfo].
extension PokemonTypeInfoPatterns on PokemonTypeInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonTypeInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonTypeInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonTypeInfo value)  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonTypeInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonTypeInfo() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name)  $default,) {final _that = this;
switch (_that) {
case _PokemonTypeInfo():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'name')  String name)?  $default,) {final _that = this;
switch (_that) {
case _PokemonTypeInfo() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonTypeInfo implements PokemonTypeInfo {
  const _PokemonTypeInfo({@JsonKey(name: 'name') required this.name});
  factory _PokemonTypeInfo.fromJson(Map<String, dynamic> json) => _$PokemonTypeInfoFromJson(json);

@override@JsonKey(name: 'name') final  String name;

/// Create a copy of PokemonTypeInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonTypeInfoCopyWith<_PokemonTypeInfo> get copyWith => __$PokemonTypeInfoCopyWithImpl<_PokemonTypeInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonTypeInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonTypeInfo&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'PokemonTypeInfo(name: $name)';
}


}

/// @nodoc
abstract mixin class _$PokemonTypeInfoCopyWith<$Res> implements $PokemonTypeInfoCopyWith<$Res> {
  factory _$PokemonTypeInfoCopyWith(_PokemonTypeInfo value, $Res Function(_PokemonTypeInfo) _then) = __$PokemonTypeInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String name
});




}
/// @nodoc
class __$PokemonTypeInfoCopyWithImpl<$Res>
    implements _$PokemonTypeInfoCopyWith<$Res> {
  __$PokemonTypeInfoCopyWithImpl(this._self, this._then);

  final _PokemonTypeInfo _self;
  final $Res Function(_PokemonTypeInfo) _then;

/// Create a copy of PokemonTypeInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_PokemonTypeInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
