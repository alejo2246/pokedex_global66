// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_type_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonTypeResponse {

@JsonKey(name: 'name') String get name;@JsonKey(name: 'damage_relations') TypeDamageRelations get damageRelations;
/// Create a copy of PokemonTypeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonTypeResponseCopyWith<PokemonTypeResponse> get copyWith => _$PokemonTypeResponseCopyWithImpl<PokemonTypeResponse>(this as PokemonTypeResponse, _$identity);

  /// Serializes this PokemonTypeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonTypeResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.damageRelations, damageRelations) || other.damageRelations == damageRelations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,damageRelations);

@override
String toString() {
  return 'PokemonTypeResponse(name: $name, damageRelations: $damageRelations)';
}


}

/// @nodoc
abstract mixin class $PokemonTypeResponseCopyWith<$Res>  {
  factory $PokemonTypeResponseCopyWith(PokemonTypeResponse value, $Res Function(PokemonTypeResponse) _then) = _$PokemonTypeResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String name,@JsonKey(name: 'damage_relations') TypeDamageRelations damageRelations
});


$TypeDamageRelationsCopyWith<$Res> get damageRelations;

}
/// @nodoc
class _$PokemonTypeResponseCopyWithImpl<$Res>
    implements $PokemonTypeResponseCopyWith<$Res> {
  _$PokemonTypeResponseCopyWithImpl(this._self, this._then);

  final PokemonTypeResponse _self;
  final $Res Function(PokemonTypeResponse) _then;

/// Create a copy of PokemonTypeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? damageRelations = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,damageRelations: null == damageRelations ? _self.damageRelations : damageRelations // ignore: cast_nullable_to_non_nullable
as TypeDamageRelations,
  ));
}
/// Create a copy of PokemonTypeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TypeDamageRelationsCopyWith<$Res> get damageRelations {
  
  return $TypeDamageRelationsCopyWith<$Res>(_self.damageRelations, (value) {
    return _then(_self.copyWith(damageRelations: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonTypeResponse].
extension PokemonTypeResponsePatterns on PokemonTypeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonTypeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonTypeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonTypeResponse value)  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonTypeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'damage_relations')  TypeDamageRelations damageRelations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonTypeResponse() when $default != null:
return $default(_that.name,_that.damageRelations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'damage_relations')  TypeDamageRelations damageRelations)  $default,) {final _that = this;
switch (_that) {
case _PokemonTypeResponse():
return $default(_that.name,_that.damageRelations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'damage_relations')  TypeDamageRelations damageRelations)?  $default,) {final _that = this;
switch (_that) {
case _PokemonTypeResponse() when $default != null:
return $default(_that.name,_that.damageRelations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonTypeResponse implements PokemonTypeResponse {
  const _PokemonTypeResponse({@JsonKey(name: 'name') required this.name, @JsonKey(name: 'damage_relations') required this.damageRelations});
  factory _PokemonTypeResponse.fromJson(Map<String, dynamic> json) => _$PokemonTypeResponseFromJson(json);

@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'damage_relations') final  TypeDamageRelations damageRelations;

/// Create a copy of PokemonTypeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonTypeResponseCopyWith<_PokemonTypeResponse> get copyWith => __$PokemonTypeResponseCopyWithImpl<_PokemonTypeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonTypeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonTypeResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.damageRelations, damageRelations) || other.damageRelations == damageRelations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,damageRelations);

@override
String toString() {
  return 'PokemonTypeResponse(name: $name, damageRelations: $damageRelations)';
}


}

/// @nodoc
abstract mixin class _$PokemonTypeResponseCopyWith<$Res> implements $PokemonTypeResponseCopyWith<$Res> {
  factory _$PokemonTypeResponseCopyWith(_PokemonTypeResponse value, $Res Function(_PokemonTypeResponse) _then) = __$PokemonTypeResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String name,@JsonKey(name: 'damage_relations') TypeDamageRelations damageRelations
});


@override $TypeDamageRelationsCopyWith<$Res> get damageRelations;

}
/// @nodoc
class __$PokemonTypeResponseCopyWithImpl<$Res>
    implements _$PokemonTypeResponseCopyWith<$Res> {
  __$PokemonTypeResponseCopyWithImpl(this._self, this._then);

  final _PokemonTypeResponse _self;
  final $Res Function(_PokemonTypeResponse) _then;

/// Create a copy of PokemonTypeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? damageRelations = null,}) {
  return _then(_PokemonTypeResponse(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,damageRelations: null == damageRelations ? _self.damageRelations : damageRelations // ignore: cast_nullable_to_non_nullable
as TypeDamageRelations,
  ));
}

/// Create a copy of PokemonTypeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TypeDamageRelationsCopyWith<$Res> get damageRelations {
  
  return $TypeDamageRelationsCopyWith<$Res>(_self.damageRelations, (value) {
    return _then(_self.copyWith(damageRelations: value));
  });
}
}


/// @nodoc
mixin _$TypeDamageRelations {

@JsonKey(name: 'double_damage_from') List<TypeNameRef> get doubleDamageFrom;@JsonKey(name: 'half_damage_from') List<TypeNameRef> get halfDamageFrom;@JsonKey(name: 'no_damage_from') List<TypeNameRef> get noDamageFrom;
/// Create a copy of TypeDamageRelations
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypeDamageRelationsCopyWith<TypeDamageRelations> get copyWith => _$TypeDamageRelationsCopyWithImpl<TypeDamageRelations>(this as TypeDamageRelations, _$identity);

  /// Serializes this TypeDamageRelations to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeDamageRelations&&const DeepCollectionEquality().equals(other.doubleDamageFrom, doubleDamageFrom)&&const DeepCollectionEquality().equals(other.halfDamageFrom, halfDamageFrom)&&const DeepCollectionEquality().equals(other.noDamageFrom, noDamageFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(doubleDamageFrom),const DeepCollectionEquality().hash(halfDamageFrom),const DeepCollectionEquality().hash(noDamageFrom));

@override
String toString() {
  return 'TypeDamageRelations(doubleDamageFrom: $doubleDamageFrom, halfDamageFrom: $halfDamageFrom, noDamageFrom: $noDamageFrom)';
}


}

/// @nodoc
abstract mixin class $TypeDamageRelationsCopyWith<$Res>  {
  factory $TypeDamageRelationsCopyWith(TypeDamageRelations value, $Res Function(TypeDamageRelations) _then) = _$TypeDamageRelationsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'double_damage_from') List<TypeNameRef> doubleDamageFrom,@JsonKey(name: 'half_damage_from') List<TypeNameRef> halfDamageFrom,@JsonKey(name: 'no_damage_from') List<TypeNameRef> noDamageFrom
});




}
/// @nodoc
class _$TypeDamageRelationsCopyWithImpl<$Res>
    implements $TypeDamageRelationsCopyWith<$Res> {
  _$TypeDamageRelationsCopyWithImpl(this._self, this._then);

  final TypeDamageRelations _self;
  final $Res Function(TypeDamageRelations) _then;

/// Create a copy of TypeDamageRelations
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doubleDamageFrom = null,Object? halfDamageFrom = null,Object? noDamageFrom = null,}) {
  return _then(_self.copyWith(
doubleDamageFrom: null == doubleDamageFrom ? _self.doubleDamageFrom : doubleDamageFrom // ignore: cast_nullable_to_non_nullable
as List<TypeNameRef>,halfDamageFrom: null == halfDamageFrom ? _self.halfDamageFrom : halfDamageFrom // ignore: cast_nullable_to_non_nullable
as List<TypeNameRef>,noDamageFrom: null == noDamageFrom ? _self.noDamageFrom : noDamageFrom // ignore: cast_nullable_to_non_nullable
as List<TypeNameRef>,
  ));
}

}


/// Adds pattern-matching-related methods to [TypeDamageRelations].
extension TypeDamageRelationsPatterns on TypeDamageRelations {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TypeDamageRelations value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TypeDamageRelations() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TypeDamageRelations value)  $default,){
final _that = this;
switch (_that) {
case _TypeDamageRelations():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TypeDamageRelations value)?  $default,){
final _that = this;
switch (_that) {
case _TypeDamageRelations() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'double_damage_from')  List<TypeNameRef> doubleDamageFrom, @JsonKey(name: 'half_damage_from')  List<TypeNameRef> halfDamageFrom, @JsonKey(name: 'no_damage_from')  List<TypeNameRef> noDamageFrom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TypeDamageRelations() when $default != null:
return $default(_that.doubleDamageFrom,_that.halfDamageFrom,_that.noDamageFrom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'double_damage_from')  List<TypeNameRef> doubleDamageFrom, @JsonKey(name: 'half_damage_from')  List<TypeNameRef> halfDamageFrom, @JsonKey(name: 'no_damage_from')  List<TypeNameRef> noDamageFrom)  $default,) {final _that = this;
switch (_that) {
case _TypeDamageRelations():
return $default(_that.doubleDamageFrom,_that.halfDamageFrom,_that.noDamageFrom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'double_damage_from')  List<TypeNameRef> doubleDamageFrom, @JsonKey(name: 'half_damage_from')  List<TypeNameRef> halfDamageFrom, @JsonKey(name: 'no_damage_from')  List<TypeNameRef> noDamageFrom)?  $default,) {final _that = this;
switch (_that) {
case _TypeDamageRelations() when $default != null:
return $default(_that.doubleDamageFrom,_that.halfDamageFrom,_that.noDamageFrom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TypeDamageRelations implements TypeDamageRelations {
  const _TypeDamageRelations({@JsonKey(name: 'double_damage_from') required final  List<TypeNameRef> doubleDamageFrom, @JsonKey(name: 'half_damage_from') required final  List<TypeNameRef> halfDamageFrom, @JsonKey(name: 'no_damage_from') required final  List<TypeNameRef> noDamageFrom}): _doubleDamageFrom = doubleDamageFrom,_halfDamageFrom = halfDamageFrom,_noDamageFrom = noDamageFrom;
  factory _TypeDamageRelations.fromJson(Map<String, dynamic> json) => _$TypeDamageRelationsFromJson(json);

 final  List<TypeNameRef> _doubleDamageFrom;
@override@JsonKey(name: 'double_damage_from') List<TypeNameRef> get doubleDamageFrom {
  if (_doubleDamageFrom is EqualUnmodifiableListView) return _doubleDamageFrom;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doubleDamageFrom);
}

 final  List<TypeNameRef> _halfDamageFrom;
@override@JsonKey(name: 'half_damage_from') List<TypeNameRef> get halfDamageFrom {
  if (_halfDamageFrom is EqualUnmodifiableListView) return _halfDamageFrom;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_halfDamageFrom);
}

 final  List<TypeNameRef> _noDamageFrom;
@override@JsonKey(name: 'no_damage_from') List<TypeNameRef> get noDamageFrom {
  if (_noDamageFrom is EqualUnmodifiableListView) return _noDamageFrom;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_noDamageFrom);
}


/// Create a copy of TypeDamageRelations
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TypeDamageRelationsCopyWith<_TypeDamageRelations> get copyWith => __$TypeDamageRelationsCopyWithImpl<_TypeDamageRelations>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TypeDamageRelationsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TypeDamageRelations&&const DeepCollectionEquality().equals(other._doubleDamageFrom, _doubleDamageFrom)&&const DeepCollectionEquality().equals(other._halfDamageFrom, _halfDamageFrom)&&const DeepCollectionEquality().equals(other._noDamageFrom, _noDamageFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_doubleDamageFrom),const DeepCollectionEquality().hash(_halfDamageFrom),const DeepCollectionEquality().hash(_noDamageFrom));

@override
String toString() {
  return 'TypeDamageRelations(doubleDamageFrom: $doubleDamageFrom, halfDamageFrom: $halfDamageFrom, noDamageFrom: $noDamageFrom)';
}


}

/// @nodoc
abstract mixin class _$TypeDamageRelationsCopyWith<$Res> implements $TypeDamageRelationsCopyWith<$Res> {
  factory _$TypeDamageRelationsCopyWith(_TypeDamageRelations value, $Res Function(_TypeDamageRelations) _then) = __$TypeDamageRelationsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'double_damage_from') List<TypeNameRef> doubleDamageFrom,@JsonKey(name: 'half_damage_from') List<TypeNameRef> halfDamageFrom,@JsonKey(name: 'no_damage_from') List<TypeNameRef> noDamageFrom
});




}
/// @nodoc
class __$TypeDamageRelationsCopyWithImpl<$Res>
    implements _$TypeDamageRelationsCopyWith<$Res> {
  __$TypeDamageRelationsCopyWithImpl(this._self, this._then);

  final _TypeDamageRelations _self;
  final $Res Function(_TypeDamageRelations) _then;

/// Create a copy of TypeDamageRelations
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doubleDamageFrom = null,Object? halfDamageFrom = null,Object? noDamageFrom = null,}) {
  return _then(_TypeDamageRelations(
doubleDamageFrom: null == doubleDamageFrom ? _self._doubleDamageFrom : doubleDamageFrom // ignore: cast_nullable_to_non_nullable
as List<TypeNameRef>,halfDamageFrom: null == halfDamageFrom ? _self._halfDamageFrom : halfDamageFrom // ignore: cast_nullable_to_non_nullable
as List<TypeNameRef>,noDamageFrom: null == noDamageFrom ? _self._noDamageFrom : noDamageFrom // ignore: cast_nullable_to_non_nullable
as List<TypeNameRef>,
  ));
}


}


/// @nodoc
mixin _$TypeNameRef {

@JsonKey(name: 'name') String get name;
/// Create a copy of TypeNameRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypeNameRefCopyWith<TypeNameRef> get copyWith => _$TypeNameRefCopyWithImpl<TypeNameRef>(this as TypeNameRef, _$identity);

  /// Serializes this TypeNameRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeNameRef&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'TypeNameRef(name: $name)';
}


}

/// @nodoc
abstract mixin class $TypeNameRefCopyWith<$Res>  {
  factory $TypeNameRefCopyWith(TypeNameRef value, $Res Function(TypeNameRef) _then) = _$TypeNameRefCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String name
});




}
/// @nodoc
class _$TypeNameRefCopyWithImpl<$Res>
    implements $TypeNameRefCopyWith<$Res> {
  _$TypeNameRefCopyWithImpl(this._self, this._then);

  final TypeNameRef _self;
  final $Res Function(TypeNameRef) _then;

/// Create a copy of TypeNameRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TypeNameRef].
extension TypeNameRefPatterns on TypeNameRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TypeNameRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TypeNameRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TypeNameRef value)  $default,){
final _that = this;
switch (_that) {
case _TypeNameRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TypeNameRef value)?  $default,){
final _that = this;
switch (_that) {
case _TypeNameRef() when $default != null:
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
case _TypeNameRef() when $default != null:
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
case _TypeNameRef():
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
case _TypeNameRef() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TypeNameRef implements TypeNameRef {
  const _TypeNameRef({@JsonKey(name: 'name') required this.name});
  factory _TypeNameRef.fromJson(Map<String, dynamic> json) => _$TypeNameRefFromJson(json);

@override@JsonKey(name: 'name') final  String name;

/// Create a copy of TypeNameRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TypeNameRefCopyWith<_TypeNameRef> get copyWith => __$TypeNameRefCopyWithImpl<_TypeNameRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TypeNameRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TypeNameRef&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'TypeNameRef(name: $name)';
}


}

/// @nodoc
abstract mixin class _$TypeNameRefCopyWith<$Res> implements $TypeNameRefCopyWith<$Res> {
  factory _$TypeNameRefCopyWith(_TypeNameRef value, $Res Function(_TypeNameRef) _then) = __$TypeNameRefCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String name
});




}
/// @nodoc
class __$TypeNameRefCopyWithImpl<$Res>
    implements _$TypeNameRefCopyWith<$Res> {
  __$TypeNameRefCopyWithImpl(this._self, this._then);

  final _TypeNameRef _self;
  final $Res Function(_TypeNameRef) _then;

/// Create a copy of TypeNameRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_TypeNameRef(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
