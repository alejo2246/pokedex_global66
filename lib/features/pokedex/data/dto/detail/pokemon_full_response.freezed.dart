// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_full_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonFullResponse {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'height') int get height;@JsonKey(name: 'weight') int get weight;@JsonKey(name: 'types') List<FullTypeSlot> get types;@JsonKey(name: 'abilities') List<FullAbilitySlot> get abilities;
/// Create a copy of PokemonFullResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonFullResponseCopyWith<PokemonFullResponse> get copyWith => _$PokemonFullResponseCopyWithImpl<PokemonFullResponse>(this as PokemonFullResponse, _$identity);

  /// Serializes this PokemonFullResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonFullResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&const DeepCollectionEquality().equals(other.types, types)&&const DeepCollectionEquality().equals(other.abilities, abilities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,height,weight,const DeepCollectionEquality().hash(types),const DeepCollectionEquality().hash(abilities));

@override
String toString() {
  return 'PokemonFullResponse(id: $id, name: $name, height: $height, weight: $weight, types: $types, abilities: $abilities)';
}


}

/// @nodoc
abstract mixin class $PokemonFullResponseCopyWith<$Res>  {
  factory $PokemonFullResponseCopyWith(PokemonFullResponse value, $Res Function(PokemonFullResponse) _then) = _$PokemonFullResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'height') int height,@JsonKey(name: 'weight') int weight,@JsonKey(name: 'types') List<FullTypeSlot> types,@JsonKey(name: 'abilities') List<FullAbilitySlot> abilities
});




}
/// @nodoc
class _$PokemonFullResponseCopyWithImpl<$Res>
    implements $PokemonFullResponseCopyWith<$Res> {
  _$PokemonFullResponseCopyWithImpl(this._self, this._then);

  final PokemonFullResponse _self;
  final $Res Function(PokemonFullResponse) _then;

/// Create a copy of PokemonFullResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? height = null,Object? weight = null,Object? types = null,Object? abilities = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<FullTypeSlot>,abilities: null == abilities ? _self.abilities : abilities // ignore: cast_nullable_to_non_nullable
as List<FullAbilitySlot>,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonFullResponse].
extension PokemonFullResponsePatterns on PokemonFullResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonFullResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonFullResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonFullResponse value)  $default,){
final _that = this;
switch (_that) {
case _PokemonFullResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonFullResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonFullResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'height')  int height, @JsonKey(name: 'weight')  int weight, @JsonKey(name: 'types')  List<FullTypeSlot> types, @JsonKey(name: 'abilities')  List<FullAbilitySlot> abilities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonFullResponse() when $default != null:
return $default(_that.id,_that.name,_that.height,_that.weight,_that.types,_that.abilities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'height')  int height, @JsonKey(name: 'weight')  int weight, @JsonKey(name: 'types')  List<FullTypeSlot> types, @JsonKey(name: 'abilities')  List<FullAbilitySlot> abilities)  $default,) {final _that = this;
switch (_that) {
case _PokemonFullResponse():
return $default(_that.id,_that.name,_that.height,_that.weight,_that.types,_that.abilities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'height')  int height, @JsonKey(name: 'weight')  int weight, @JsonKey(name: 'types')  List<FullTypeSlot> types, @JsonKey(name: 'abilities')  List<FullAbilitySlot> abilities)?  $default,) {final _that = this;
switch (_that) {
case _PokemonFullResponse() when $default != null:
return $default(_that.id,_that.name,_that.height,_that.weight,_that.types,_that.abilities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonFullResponse implements PokemonFullResponse {
  const _PokemonFullResponse({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'height') required this.height, @JsonKey(name: 'weight') required this.weight, @JsonKey(name: 'types') required final  List<FullTypeSlot> types, @JsonKey(name: 'abilities') required final  List<FullAbilitySlot> abilities}): _types = types,_abilities = abilities;
  factory _PokemonFullResponse.fromJson(Map<String, dynamic> json) => _$PokemonFullResponseFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'height') final  int height;
@override@JsonKey(name: 'weight') final  int weight;
 final  List<FullTypeSlot> _types;
@override@JsonKey(name: 'types') List<FullTypeSlot> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

 final  List<FullAbilitySlot> _abilities;
@override@JsonKey(name: 'abilities') List<FullAbilitySlot> get abilities {
  if (_abilities is EqualUnmodifiableListView) return _abilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_abilities);
}


/// Create a copy of PokemonFullResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonFullResponseCopyWith<_PokemonFullResponse> get copyWith => __$PokemonFullResponseCopyWithImpl<_PokemonFullResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonFullResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonFullResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&const DeepCollectionEquality().equals(other._types, _types)&&const DeepCollectionEquality().equals(other._abilities, _abilities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,height,weight,const DeepCollectionEquality().hash(_types),const DeepCollectionEquality().hash(_abilities));

@override
String toString() {
  return 'PokemonFullResponse(id: $id, name: $name, height: $height, weight: $weight, types: $types, abilities: $abilities)';
}


}

/// @nodoc
abstract mixin class _$PokemonFullResponseCopyWith<$Res> implements $PokemonFullResponseCopyWith<$Res> {
  factory _$PokemonFullResponseCopyWith(_PokemonFullResponse value, $Res Function(_PokemonFullResponse) _then) = __$PokemonFullResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'height') int height,@JsonKey(name: 'weight') int weight,@JsonKey(name: 'types') List<FullTypeSlot> types,@JsonKey(name: 'abilities') List<FullAbilitySlot> abilities
});




}
/// @nodoc
class __$PokemonFullResponseCopyWithImpl<$Res>
    implements _$PokemonFullResponseCopyWith<$Res> {
  __$PokemonFullResponseCopyWithImpl(this._self, this._then);

  final _PokemonFullResponse _self;
  final $Res Function(_PokemonFullResponse) _then;

/// Create a copy of PokemonFullResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? height = null,Object? weight = null,Object? types = null,Object? abilities = null,}) {
  return _then(_PokemonFullResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<FullTypeSlot>,abilities: null == abilities ? _self._abilities : abilities // ignore: cast_nullable_to_non_nullable
as List<FullAbilitySlot>,
  ));
}


}


/// @nodoc
mixin _$FullTypeSlot {

@JsonKey(name: 'slot') int get slot;@JsonKey(name: 'type') FullTypeName get type;
/// Create a copy of FullTypeSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FullTypeSlotCopyWith<FullTypeSlot> get copyWith => _$FullTypeSlotCopyWithImpl<FullTypeSlot>(this as FullTypeSlot, _$identity);

  /// Serializes this FullTypeSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FullTypeSlot&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slot,type);

@override
String toString() {
  return 'FullTypeSlot(slot: $slot, type: $type)';
}


}

/// @nodoc
abstract mixin class $FullTypeSlotCopyWith<$Res>  {
  factory $FullTypeSlotCopyWith(FullTypeSlot value, $Res Function(FullTypeSlot) _then) = _$FullTypeSlotCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'slot') int slot,@JsonKey(name: 'type') FullTypeName type
});


$FullTypeNameCopyWith<$Res> get type;

}
/// @nodoc
class _$FullTypeSlotCopyWithImpl<$Res>
    implements $FullTypeSlotCopyWith<$Res> {
  _$FullTypeSlotCopyWithImpl(this._self, this._then);

  final FullTypeSlot _self;
  final $Res Function(FullTypeSlot) _then;

/// Create a copy of FullTypeSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slot = null,Object? type = null,}) {
  return _then(_self.copyWith(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FullTypeName,
  ));
}
/// Create a copy of FullTypeSlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FullTypeNameCopyWith<$Res> get type {
  
  return $FullTypeNameCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [FullTypeSlot].
extension FullTypeSlotPatterns on FullTypeSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FullTypeSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FullTypeSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FullTypeSlot value)  $default,){
final _that = this;
switch (_that) {
case _FullTypeSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FullTypeSlot value)?  $default,){
final _that = this;
switch (_that) {
case _FullTypeSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'slot')  int slot, @JsonKey(name: 'type')  FullTypeName type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FullTypeSlot() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'slot')  int slot, @JsonKey(name: 'type')  FullTypeName type)  $default,) {final _that = this;
switch (_that) {
case _FullTypeSlot():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'slot')  int slot, @JsonKey(name: 'type')  FullTypeName type)?  $default,) {final _that = this;
switch (_that) {
case _FullTypeSlot() when $default != null:
return $default(_that.slot,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FullTypeSlot implements FullTypeSlot {
  const _FullTypeSlot({@JsonKey(name: 'slot') required this.slot, @JsonKey(name: 'type') required this.type});
  factory _FullTypeSlot.fromJson(Map<String, dynamic> json) => _$FullTypeSlotFromJson(json);

@override@JsonKey(name: 'slot') final  int slot;
@override@JsonKey(name: 'type') final  FullTypeName type;

/// Create a copy of FullTypeSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FullTypeSlotCopyWith<_FullTypeSlot> get copyWith => __$FullTypeSlotCopyWithImpl<_FullTypeSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FullTypeSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FullTypeSlot&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slot,type);

@override
String toString() {
  return 'FullTypeSlot(slot: $slot, type: $type)';
}


}

/// @nodoc
abstract mixin class _$FullTypeSlotCopyWith<$Res> implements $FullTypeSlotCopyWith<$Res> {
  factory _$FullTypeSlotCopyWith(_FullTypeSlot value, $Res Function(_FullTypeSlot) _then) = __$FullTypeSlotCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'slot') int slot,@JsonKey(name: 'type') FullTypeName type
});


@override $FullTypeNameCopyWith<$Res> get type;

}
/// @nodoc
class __$FullTypeSlotCopyWithImpl<$Res>
    implements _$FullTypeSlotCopyWith<$Res> {
  __$FullTypeSlotCopyWithImpl(this._self, this._then);

  final _FullTypeSlot _self;
  final $Res Function(_FullTypeSlot) _then;

/// Create a copy of FullTypeSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slot = null,Object? type = null,}) {
  return _then(_FullTypeSlot(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FullTypeName,
  ));
}

/// Create a copy of FullTypeSlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FullTypeNameCopyWith<$Res> get type {
  
  return $FullTypeNameCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// @nodoc
mixin _$FullTypeName {

@JsonKey(name: 'name') String get name;
/// Create a copy of FullTypeName
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FullTypeNameCopyWith<FullTypeName> get copyWith => _$FullTypeNameCopyWithImpl<FullTypeName>(this as FullTypeName, _$identity);

  /// Serializes this FullTypeName to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FullTypeName&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'FullTypeName(name: $name)';
}


}

/// @nodoc
abstract mixin class $FullTypeNameCopyWith<$Res>  {
  factory $FullTypeNameCopyWith(FullTypeName value, $Res Function(FullTypeName) _then) = _$FullTypeNameCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String name
});




}
/// @nodoc
class _$FullTypeNameCopyWithImpl<$Res>
    implements $FullTypeNameCopyWith<$Res> {
  _$FullTypeNameCopyWithImpl(this._self, this._then);

  final FullTypeName _self;
  final $Res Function(FullTypeName) _then;

/// Create a copy of FullTypeName
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FullTypeName].
extension FullTypeNamePatterns on FullTypeName {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FullTypeName value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FullTypeName() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FullTypeName value)  $default,){
final _that = this;
switch (_that) {
case _FullTypeName():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FullTypeName value)?  $default,){
final _that = this;
switch (_that) {
case _FullTypeName() when $default != null:
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
case _FullTypeName() when $default != null:
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
case _FullTypeName():
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
case _FullTypeName() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FullTypeName implements FullTypeName {
  const _FullTypeName({@JsonKey(name: 'name') required this.name});
  factory _FullTypeName.fromJson(Map<String, dynamic> json) => _$FullTypeNameFromJson(json);

@override@JsonKey(name: 'name') final  String name;

/// Create a copy of FullTypeName
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FullTypeNameCopyWith<_FullTypeName> get copyWith => __$FullTypeNameCopyWithImpl<_FullTypeName>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FullTypeNameToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FullTypeName&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'FullTypeName(name: $name)';
}


}

/// @nodoc
abstract mixin class _$FullTypeNameCopyWith<$Res> implements $FullTypeNameCopyWith<$Res> {
  factory _$FullTypeNameCopyWith(_FullTypeName value, $Res Function(_FullTypeName) _then) = __$FullTypeNameCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String name
});




}
/// @nodoc
class __$FullTypeNameCopyWithImpl<$Res>
    implements _$FullTypeNameCopyWith<$Res> {
  __$FullTypeNameCopyWithImpl(this._self, this._then);

  final _FullTypeName _self;
  final $Res Function(_FullTypeName) _then;

/// Create a copy of FullTypeName
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_FullTypeName(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FullAbilitySlot {

@JsonKey(name: 'ability') FullAbilityName get ability;@JsonKey(name: 'is_hidden') bool get isHidden;
/// Create a copy of FullAbilitySlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FullAbilitySlotCopyWith<FullAbilitySlot> get copyWith => _$FullAbilitySlotCopyWithImpl<FullAbilitySlot>(this as FullAbilitySlot, _$identity);

  /// Serializes this FullAbilitySlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FullAbilitySlot&&(identical(other.ability, ability) || other.ability == ability)&&(identical(other.isHidden, isHidden) || other.isHidden == isHidden));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ability,isHidden);

@override
String toString() {
  return 'FullAbilitySlot(ability: $ability, isHidden: $isHidden)';
}


}

/// @nodoc
abstract mixin class $FullAbilitySlotCopyWith<$Res>  {
  factory $FullAbilitySlotCopyWith(FullAbilitySlot value, $Res Function(FullAbilitySlot) _then) = _$FullAbilitySlotCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ability') FullAbilityName ability,@JsonKey(name: 'is_hidden') bool isHidden
});


$FullAbilityNameCopyWith<$Res> get ability;

}
/// @nodoc
class _$FullAbilitySlotCopyWithImpl<$Res>
    implements $FullAbilitySlotCopyWith<$Res> {
  _$FullAbilitySlotCopyWithImpl(this._self, this._then);

  final FullAbilitySlot _self;
  final $Res Function(FullAbilitySlot) _then;

/// Create a copy of FullAbilitySlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ability = null,Object? isHidden = null,}) {
  return _then(_self.copyWith(
ability: null == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as FullAbilityName,isHidden: null == isHidden ? _self.isHidden : isHidden // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of FullAbilitySlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FullAbilityNameCopyWith<$Res> get ability {
  
  return $FullAbilityNameCopyWith<$Res>(_self.ability, (value) {
    return _then(_self.copyWith(ability: value));
  });
}
}


/// Adds pattern-matching-related methods to [FullAbilitySlot].
extension FullAbilitySlotPatterns on FullAbilitySlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FullAbilitySlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FullAbilitySlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FullAbilitySlot value)  $default,){
final _that = this;
switch (_that) {
case _FullAbilitySlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FullAbilitySlot value)?  $default,){
final _that = this;
switch (_that) {
case _FullAbilitySlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ability')  FullAbilityName ability, @JsonKey(name: 'is_hidden')  bool isHidden)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FullAbilitySlot() when $default != null:
return $default(_that.ability,_that.isHidden);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ability')  FullAbilityName ability, @JsonKey(name: 'is_hidden')  bool isHidden)  $default,) {final _that = this;
switch (_that) {
case _FullAbilitySlot():
return $default(_that.ability,_that.isHidden);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ability')  FullAbilityName ability, @JsonKey(name: 'is_hidden')  bool isHidden)?  $default,) {final _that = this;
switch (_that) {
case _FullAbilitySlot() when $default != null:
return $default(_that.ability,_that.isHidden);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FullAbilitySlot implements FullAbilitySlot {
  const _FullAbilitySlot({@JsonKey(name: 'ability') required this.ability, @JsonKey(name: 'is_hidden') required this.isHidden});
  factory _FullAbilitySlot.fromJson(Map<String, dynamic> json) => _$FullAbilitySlotFromJson(json);

@override@JsonKey(name: 'ability') final  FullAbilityName ability;
@override@JsonKey(name: 'is_hidden') final  bool isHidden;

/// Create a copy of FullAbilitySlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FullAbilitySlotCopyWith<_FullAbilitySlot> get copyWith => __$FullAbilitySlotCopyWithImpl<_FullAbilitySlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FullAbilitySlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FullAbilitySlot&&(identical(other.ability, ability) || other.ability == ability)&&(identical(other.isHidden, isHidden) || other.isHidden == isHidden));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ability,isHidden);

@override
String toString() {
  return 'FullAbilitySlot(ability: $ability, isHidden: $isHidden)';
}


}

/// @nodoc
abstract mixin class _$FullAbilitySlotCopyWith<$Res> implements $FullAbilitySlotCopyWith<$Res> {
  factory _$FullAbilitySlotCopyWith(_FullAbilitySlot value, $Res Function(_FullAbilitySlot) _then) = __$FullAbilitySlotCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ability') FullAbilityName ability,@JsonKey(name: 'is_hidden') bool isHidden
});


@override $FullAbilityNameCopyWith<$Res> get ability;

}
/// @nodoc
class __$FullAbilitySlotCopyWithImpl<$Res>
    implements _$FullAbilitySlotCopyWith<$Res> {
  __$FullAbilitySlotCopyWithImpl(this._self, this._then);

  final _FullAbilitySlot _self;
  final $Res Function(_FullAbilitySlot) _then;

/// Create a copy of FullAbilitySlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ability = null,Object? isHidden = null,}) {
  return _then(_FullAbilitySlot(
ability: null == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as FullAbilityName,isHidden: null == isHidden ? _self.isHidden : isHidden // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of FullAbilitySlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FullAbilityNameCopyWith<$Res> get ability {
  
  return $FullAbilityNameCopyWith<$Res>(_self.ability, (value) {
    return _then(_self.copyWith(ability: value));
  });
}
}


/// @nodoc
mixin _$FullAbilityName {

@JsonKey(name: 'name') String get name;
/// Create a copy of FullAbilityName
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FullAbilityNameCopyWith<FullAbilityName> get copyWith => _$FullAbilityNameCopyWithImpl<FullAbilityName>(this as FullAbilityName, _$identity);

  /// Serializes this FullAbilityName to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FullAbilityName&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'FullAbilityName(name: $name)';
}


}

/// @nodoc
abstract mixin class $FullAbilityNameCopyWith<$Res>  {
  factory $FullAbilityNameCopyWith(FullAbilityName value, $Res Function(FullAbilityName) _then) = _$FullAbilityNameCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String name
});




}
/// @nodoc
class _$FullAbilityNameCopyWithImpl<$Res>
    implements $FullAbilityNameCopyWith<$Res> {
  _$FullAbilityNameCopyWithImpl(this._self, this._then);

  final FullAbilityName _self;
  final $Res Function(FullAbilityName) _then;

/// Create a copy of FullAbilityName
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FullAbilityName].
extension FullAbilityNamePatterns on FullAbilityName {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FullAbilityName value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FullAbilityName() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FullAbilityName value)  $default,){
final _that = this;
switch (_that) {
case _FullAbilityName():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FullAbilityName value)?  $default,){
final _that = this;
switch (_that) {
case _FullAbilityName() when $default != null:
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
case _FullAbilityName() when $default != null:
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
case _FullAbilityName():
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
case _FullAbilityName() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FullAbilityName implements FullAbilityName {
  const _FullAbilityName({@JsonKey(name: 'name') required this.name});
  factory _FullAbilityName.fromJson(Map<String, dynamic> json) => _$FullAbilityNameFromJson(json);

@override@JsonKey(name: 'name') final  String name;

/// Create a copy of FullAbilityName
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FullAbilityNameCopyWith<_FullAbilityName> get copyWith => __$FullAbilityNameCopyWithImpl<_FullAbilityName>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FullAbilityNameToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FullAbilityName&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'FullAbilityName(name: $name)';
}


}

/// @nodoc
abstract mixin class _$FullAbilityNameCopyWith<$Res> implements $FullAbilityNameCopyWith<$Res> {
  factory _$FullAbilityNameCopyWith(_FullAbilityName value, $Res Function(_FullAbilityName) _then) = __$FullAbilityNameCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String name
});




}
/// @nodoc
class __$FullAbilityNameCopyWithImpl<$Res>
    implements _$FullAbilityNameCopyWith<$Res> {
  __$FullAbilityNameCopyWithImpl(this._self, this._then);

  final _FullAbilityName _self;
  final $Res Function(_FullAbilityName) _then;

/// Create a copy of FullAbilityName
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_FullAbilityName(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
