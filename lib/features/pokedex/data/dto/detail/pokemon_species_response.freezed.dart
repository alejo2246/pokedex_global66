// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_species_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonSpeciesResponse {

@JsonKey(name: 'gender_rate') int get genderRate;@JsonKey(name: 'flavor_text_entries') List<FlavorTextEntry> get flavorTextEntries; List<Genus> get genera;
/// Create a copy of PokemonSpeciesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonSpeciesResponseCopyWith<PokemonSpeciesResponse> get copyWith => _$PokemonSpeciesResponseCopyWithImpl<PokemonSpeciesResponse>(this as PokemonSpeciesResponse, _$identity);

  /// Serializes this PokemonSpeciesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonSpeciesResponse&&(identical(other.genderRate, genderRate) || other.genderRate == genderRate)&&const DeepCollectionEquality().equals(other.flavorTextEntries, flavorTextEntries)&&const DeepCollectionEquality().equals(other.genera, genera));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genderRate,const DeepCollectionEquality().hash(flavorTextEntries),const DeepCollectionEquality().hash(genera));

@override
String toString() {
  return 'PokemonSpeciesResponse(genderRate: $genderRate, flavorTextEntries: $flavorTextEntries, genera: $genera)';
}


}

/// @nodoc
abstract mixin class $PokemonSpeciesResponseCopyWith<$Res>  {
  factory $PokemonSpeciesResponseCopyWith(PokemonSpeciesResponse value, $Res Function(PokemonSpeciesResponse) _then) = _$PokemonSpeciesResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'gender_rate') int genderRate,@JsonKey(name: 'flavor_text_entries') List<FlavorTextEntry> flavorTextEntries, List<Genus> genera
});




}
/// @nodoc
class _$PokemonSpeciesResponseCopyWithImpl<$Res>
    implements $PokemonSpeciesResponseCopyWith<$Res> {
  _$PokemonSpeciesResponseCopyWithImpl(this._self, this._then);

  final PokemonSpeciesResponse _self;
  final $Res Function(PokemonSpeciesResponse) _then;

/// Create a copy of PokemonSpeciesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genderRate = null,Object? flavorTextEntries = null,Object? genera = null,}) {
  return _then(_self.copyWith(
genderRate: null == genderRate ? _self.genderRate : genderRate // ignore: cast_nullable_to_non_nullable
as int,flavorTextEntries: null == flavorTextEntries ? _self.flavorTextEntries : flavorTextEntries // ignore: cast_nullable_to_non_nullable
as List<FlavorTextEntry>,genera: null == genera ? _self.genera : genera // ignore: cast_nullable_to_non_nullable
as List<Genus>,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonSpeciesResponse].
extension PokemonSpeciesResponsePatterns on PokemonSpeciesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonSpeciesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonSpeciesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonSpeciesResponse value)  $default,){
final _that = this;
switch (_that) {
case _PokemonSpeciesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonSpeciesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonSpeciesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'gender_rate')  int genderRate, @JsonKey(name: 'flavor_text_entries')  List<FlavorTextEntry> flavorTextEntries,  List<Genus> genera)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonSpeciesResponse() when $default != null:
return $default(_that.genderRate,_that.flavorTextEntries,_that.genera);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'gender_rate')  int genderRate, @JsonKey(name: 'flavor_text_entries')  List<FlavorTextEntry> flavorTextEntries,  List<Genus> genera)  $default,) {final _that = this;
switch (_that) {
case _PokemonSpeciesResponse():
return $default(_that.genderRate,_that.flavorTextEntries,_that.genera);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'gender_rate')  int genderRate, @JsonKey(name: 'flavor_text_entries')  List<FlavorTextEntry> flavorTextEntries,  List<Genus> genera)?  $default,) {final _that = this;
switch (_that) {
case _PokemonSpeciesResponse() when $default != null:
return $default(_that.genderRate,_that.flavorTextEntries,_that.genera);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonSpeciesResponse implements PokemonSpeciesResponse {
  const _PokemonSpeciesResponse({@JsonKey(name: 'gender_rate') required this.genderRate, @JsonKey(name: 'flavor_text_entries') required final  List<FlavorTextEntry> flavorTextEntries, required final  List<Genus> genera}): _flavorTextEntries = flavorTextEntries,_genera = genera;
  factory _PokemonSpeciesResponse.fromJson(Map<String, dynamic> json) => _$PokemonSpeciesResponseFromJson(json);

@override@JsonKey(name: 'gender_rate') final  int genderRate;
 final  List<FlavorTextEntry> _flavorTextEntries;
@override@JsonKey(name: 'flavor_text_entries') List<FlavorTextEntry> get flavorTextEntries {
  if (_flavorTextEntries is EqualUnmodifiableListView) return _flavorTextEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flavorTextEntries);
}

 final  List<Genus> _genera;
@override List<Genus> get genera {
  if (_genera is EqualUnmodifiableListView) return _genera;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genera);
}


/// Create a copy of PokemonSpeciesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonSpeciesResponseCopyWith<_PokemonSpeciesResponse> get copyWith => __$PokemonSpeciesResponseCopyWithImpl<_PokemonSpeciesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonSpeciesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonSpeciesResponse&&(identical(other.genderRate, genderRate) || other.genderRate == genderRate)&&const DeepCollectionEquality().equals(other._flavorTextEntries, _flavorTextEntries)&&const DeepCollectionEquality().equals(other._genera, _genera));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genderRate,const DeepCollectionEquality().hash(_flavorTextEntries),const DeepCollectionEquality().hash(_genera));

@override
String toString() {
  return 'PokemonSpeciesResponse(genderRate: $genderRate, flavorTextEntries: $flavorTextEntries, genera: $genera)';
}


}

/// @nodoc
abstract mixin class _$PokemonSpeciesResponseCopyWith<$Res> implements $PokemonSpeciesResponseCopyWith<$Res> {
  factory _$PokemonSpeciesResponseCopyWith(_PokemonSpeciesResponse value, $Res Function(_PokemonSpeciesResponse) _then) = __$PokemonSpeciesResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'gender_rate') int genderRate,@JsonKey(name: 'flavor_text_entries') List<FlavorTextEntry> flavorTextEntries, List<Genus> genera
});




}
/// @nodoc
class __$PokemonSpeciesResponseCopyWithImpl<$Res>
    implements _$PokemonSpeciesResponseCopyWith<$Res> {
  __$PokemonSpeciesResponseCopyWithImpl(this._self, this._then);

  final _PokemonSpeciesResponse _self;
  final $Res Function(_PokemonSpeciesResponse) _then;

/// Create a copy of PokemonSpeciesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genderRate = null,Object? flavorTextEntries = null,Object? genera = null,}) {
  return _then(_PokemonSpeciesResponse(
genderRate: null == genderRate ? _self.genderRate : genderRate // ignore: cast_nullable_to_non_nullable
as int,flavorTextEntries: null == flavorTextEntries ? _self._flavorTextEntries : flavorTextEntries // ignore: cast_nullable_to_non_nullable
as List<FlavorTextEntry>,genera: null == genera ? _self._genera : genera // ignore: cast_nullable_to_non_nullable
as List<Genus>,
  ));
}


}


/// @nodoc
mixin _$FlavorTextEntry {

@JsonKey(name: 'flavor_text') String get flavorText; SpeciesLanguage get language;
/// Create a copy of FlavorTextEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlavorTextEntryCopyWith<FlavorTextEntry> get copyWith => _$FlavorTextEntryCopyWithImpl<FlavorTextEntry>(this as FlavorTextEntry, _$identity);

  /// Serializes this FlavorTextEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlavorTextEntry&&(identical(other.flavorText, flavorText) || other.flavorText == flavorText)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flavorText,language);

@override
String toString() {
  return 'FlavorTextEntry(flavorText: $flavorText, language: $language)';
}


}

/// @nodoc
abstract mixin class $FlavorTextEntryCopyWith<$Res>  {
  factory $FlavorTextEntryCopyWith(FlavorTextEntry value, $Res Function(FlavorTextEntry) _then) = _$FlavorTextEntryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'flavor_text') String flavorText, SpeciesLanguage language
});


$SpeciesLanguageCopyWith<$Res> get language;

}
/// @nodoc
class _$FlavorTextEntryCopyWithImpl<$Res>
    implements $FlavorTextEntryCopyWith<$Res> {
  _$FlavorTextEntryCopyWithImpl(this._self, this._then);

  final FlavorTextEntry _self;
  final $Res Function(FlavorTextEntry) _then;

/// Create a copy of FlavorTextEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flavorText = null,Object? language = null,}) {
  return _then(_self.copyWith(
flavorText: null == flavorText ? _self.flavorText : flavorText // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as SpeciesLanguage,
  ));
}
/// Create a copy of FlavorTextEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpeciesLanguageCopyWith<$Res> get language {
  
  return $SpeciesLanguageCopyWith<$Res>(_self.language, (value) {
    return _then(_self.copyWith(language: value));
  });
}
}


/// Adds pattern-matching-related methods to [FlavorTextEntry].
extension FlavorTextEntryPatterns on FlavorTextEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlavorTextEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlavorTextEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlavorTextEntry value)  $default,){
final _that = this;
switch (_that) {
case _FlavorTextEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlavorTextEntry value)?  $default,){
final _that = this;
switch (_that) {
case _FlavorTextEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'flavor_text')  String flavorText,  SpeciesLanguage language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlavorTextEntry() when $default != null:
return $default(_that.flavorText,_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'flavor_text')  String flavorText,  SpeciesLanguage language)  $default,) {final _that = this;
switch (_that) {
case _FlavorTextEntry():
return $default(_that.flavorText,_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'flavor_text')  String flavorText,  SpeciesLanguage language)?  $default,) {final _that = this;
switch (_that) {
case _FlavorTextEntry() when $default != null:
return $default(_that.flavorText,_that.language);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlavorTextEntry implements FlavorTextEntry {
  const _FlavorTextEntry({@JsonKey(name: 'flavor_text') required this.flavorText, required this.language});
  factory _FlavorTextEntry.fromJson(Map<String, dynamic> json) => _$FlavorTextEntryFromJson(json);

@override@JsonKey(name: 'flavor_text') final  String flavorText;
@override final  SpeciesLanguage language;

/// Create a copy of FlavorTextEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlavorTextEntryCopyWith<_FlavorTextEntry> get copyWith => __$FlavorTextEntryCopyWithImpl<_FlavorTextEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlavorTextEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlavorTextEntry&&(identical(other.flavorText, flavorText) || other.flavorText == flavorText)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flavorText,language);

@override
String toString() {
  return 'FlavorTextEntry(flavorText: $flavorText, language: $language)';
}


}

/// @nodoc
abstract mixin class _$FlavorTextEntryCopyWith<$Res> implements $FlavorTextEntryCopyWith<$Res> {
  factory _$FlavorTextEntryCopyWith(_FlavorTextEntry value, $Res Function(_FlavorTextEntry) _then) = __$FlavorTextEntryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'flavor_text') String flavorText, SpeciesLanguage language
});


@override $SpeciesLanguageCopyWith<$Res> get language;

}
/// @nodoc
class __$FlavorTextEntryCopyWithImpl<$Res>
    implements _$FlavorTextEntryCopyWith<$Res> {
  __$FlavorTextEntryCopyWithImpl(this._self, this._then);

  final _FlavorTextEntry _self;
  final $Res Function(_FlavorTextEntry) _then;

/// Create a copy of FlavorTextEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flavorText = null,Object? language = null,}) {
  return _then(_FlavorTextEntry(
flavorText: null == flavorText ? _self.flavorText : flavorText // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as SpeciesLanguage,
  ));
}

/// Create a copy of FlavorTextEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpeciesLanguageCopyWith<$Res> get language {
  
  return $SpeciesLanguageCopyWith<$Res>(_self.language, (value) {
    return _then(_self.copyWith(language: value));
  });
}
}


/// @nodoc
mixin _$Genus {

 String get genus; SpeciesLanguage get language;
/// Create a copy of Genus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenusCopyWith<Genus> get copyWith => _$GenusCopyWithImpl<Genus>(this as Genus, _$identity);

  /// Serializes this Genus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Genus&&(identical(other.genus, genus) || other.genus == genus)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genus,language);

@override
String toString() {
  return 'Genus(genus: $genus, language: $language)';
}


}

/// @nodoc
abstract mixin class $GenusCopyWith<$Res>  {
  factory $GenusCopyWith(Genus value, $Res Function(Genus) _then) = _$GenusCopyWithImpl;
@useResult
$Res call({
 String genus, SpeciesLanguage language
});


$SpeciesLanguageCopyWith<$Res> get language;

}
/// @nodoc
class _$GenusCopyWithImpl<$Res>
    implements $GenusCopyWith<$Res> {
  _$GenusCopyWithImpl(this._self, this._then);

  final Genus _self;
  final $Res Function(Genus) _then;

/// Create a copy of Genus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genus = null,Object? language = null,}) {
  return _then(_self.copyWith(
genus: null == genus ? _self.genus : genus // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as SpeciesLanguage,
  ));
}
/// Create a copy of Genus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpeciesLanguageCopyWith<$Res> get language {
  
  return $SpeciesLanguageCopyWith<$Res>(_self.language, (value) {
    return _then(_self.copyWith(language: value));
  });
}
}


/// Adds pattern-matching-related methods to [Genus].
extension GenusPatterns on Genus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Genus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Genus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Genus value)  $default,){
final _that = this;
switch (_that) {
case _Genus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Genus value)?  $default,){
final _that = this;
switch (_that) {
case _Genus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String genus,  SpeciesLanguage language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Genus() when $default != null:
return $default(_that.genus,_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String genus,  SpeciesLanguage language)  $default,) {final _that = this;
switch (_that) {
case _Genus():
return $default(_that.genus,_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String genus,  SpeciesLanguage language)?  $default,) {final _that = this;
switch (_that) {
case _Genus() when $default != null:
return $default(_that.genus,_that.language);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Genus implements Genus {
  const _Genus({required this.genus, required this.language});
  factory _Genus.fromJson(Map<String, dynamic> json) => _$GenusFromJson(json);

@override final  String genus;
@override final  SpeciesLanguage language;

/// Create a copy of Genus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenusCopyWith<_Genus> get copyWith => __$GenusCopyWithImpl<_Genus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Genus&&(identical(other.genus, genus) || other.genus == genus)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genus,language);

@override
String toString() {
  return 'Genus(genus: $genus, language: $language)';
}


}

/// @nodoc
abstract mixin class _$GenusCopyWith<$Res> implements $GenusCopyWith<$Res> {
  factory _$GenusCopyWith(_Genus value, $Res Function(_Genus) _then) = __$GenusCopyWithImpl;
@override @useResult
$Res call({
 String genus, SpeciesLanguage language
});


@override $SpeciesLanguageCopyWith<$Res> get language;

}
/// @nodoc
class __$GenusCopyWithImpl<$Res>
    implements _$GenusCopyWith<$Res> {
  __$GenusCopyWithImpl(this._self, this._then);

  final _Genus _self;
  final $Res Function(_Genus) _then;

/// Create a copy of Genus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genus = null,Object? language = null,}) {
  return _then(_Genus(
genus: null == genus ? _self.genus : genus // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as SpeciesLanguage,
  ));
}

/// Create a copy of Genus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpeciesLanguageCopyWith<$Res> get language {
  
  return $SpeciesLanguageCopyWith<$Res>(_self.language, (value) {
    return _then(_self.copyWith(language: value));
  });
}
}


/// @nodoc
mixin _$SpeciesLanguage {

 String get name;
/// Create a copy of SpeciesLanguage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeciesLanguageCopyWith<SpeciesLanguage> get copyWith => _$SpeciesLanguageCopyWithImpl<SpeciesLanguage>(this as SpeciesLanguage, _$identity);

  /// Serializes this SpeciesLanguage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeciesLanguage&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'SpeciesLanguage(name: $name)';
}


}

/// @nodoc
abstract mixin class $SpeciesLanguageCopyWith<$Res>  {
  factory $SpeciesLanguageCopyWith(SpeciesLanguage value, $Res Function(SpeciesLanguage) _then) = _$SpeciesLanguageCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$SpeciesLanguageCopyWithImpl<$Res>
    implements $SpeciesLanguageCopyWith<$Res> {
  _$SpeciesLanguageCopyWithImpl(this._self, this._then);

  final SpeciesLanguage _self;
  final $Res Function(SpeciesLanguage) _then;

/// Create a copy of SpeciesLanguage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpeciesLanguage].
extension SpeciesLanguagePatterns on SpeciesLanguage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeciesLanguage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeciesLanguage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeciesLanguage value)  $default,){
final _that = this;
switch (_that) {
case _SpeciesLanguage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeciesLanguage value)?  $default,){
final _that = this;
switch (_that) {
case _SpeciesLanguage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeciesLanguage() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _SpeciesLanguage():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _SpeciesLanguage() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeciesLanguage implements SpeciesLanguage {
  const _SpeciesLanguage({required this.name});
  factory _SpeciesLanguage.fromJson(Map<String, dynamic> json) => _$SpeciesLanguageFromJson(json);

@override final  String name;

/// Create a copy of SpeciesLanguage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeciesLanguageCopyWith<_SpeciesLanguage> get copyWith => __$SpeciesLanguageCopyWithImpl<_SpeciesLanguage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeciesLanguageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeciesLanguage&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'SpeciesLanguage(name: $name)';
}


}

/// @nodoc
abstract mixin class _$SpeciesLanguageCopyWith<$Res> implements $SpeciesLanguageCopyWith<$Res> {
  factory _$SpeciesLanguageCopyWith(_SpeciesLanguage value, $Res Function(_SpeciesLanguage) _then) = __$SpeciesLanguageCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$SpeciesLanguageCopyWithImpl<$Res>
    implements _$SpeciesLanguageCopyWith<$Res> {
  __$SpeciesLanguageCopyWithImpl(this._self, this._then);

  final _SpeciesLanguage _self;
  final $Res Function(_SpeciesLanguage) _then;

/// Create a copy of SpeciesLanguage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_SpeciesLanguage(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
