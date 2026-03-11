// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonListResponse {

@JsonKey(name: "count") int get count;@JsonKey(name: "next") String? get next;@JsonKey(name: "previous") dynamic get previous;@JsonKey(name: "results") List<PokemonEntryModel> get results;
/// Create a copy of PokemonListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonListResponseCopyWith<PokemonListResponse> get copyWith => _$PokemonListResponseCopyWithImpl<PokemonListResponse>(this as PokemonListResponse, _$identity);

  /// Serializes this PokemonListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonListResponse&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&const DeepCollectionEquality().equals(other.previous, previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,const DeepCollectionEquality().hash(previous),const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PokemonListResponse(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PokemonListResponseCopyWith<$Res>  {
  factory $PokemonListResponseCopyWith(PokemonListResponse value, $Res Function(PokemonListResponse) _then) = _$PokemonListResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "count") int count,@JsonKey(name: "next") String? next,@JsonKey(name: "previous") dynamic previous,@JsonKey(name: "results") List<PokemonEntryModel> results
});




}
/// @nodoc
class _$PokemonListResponseCopyWithImpl<$Res>
    implements $PokemonListResponseCopyWith<$Res> {
  _$PokemonListResponseCopyWithImpl(this._self, this._then);

  final PokemonListResponse _self;
  final $Res Function(PokemonListResponse) _then;

/// Create a copy of PokemonListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as dynamic,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<PokemonEntryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonListResponse].
extension PokemonListResponsePatterns on PokemonListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonListResponse value)  $default,){
final _that = this;
switch (_that) {
case _PokemonListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "count")  int count, @JsonKey(name: "next")  String? next, @JsonKey(name: "previous")  dynamic previous, @JsonKey(name: "results")  List<PokemonEntryModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonListResponse() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "count")  int count, @JsonKey(name: "next")  String? next, @JsonKey(name: "previous")  dynamic previous, @JsonKey(name: "results")  List<PokemonEntryModel> results)  $default,) {final _that = this;
switch (_that) {
case _PokemonListResponse():
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "count")  int count, @JsonKey(name: "next")  String? next, @JsonKey(name: "previous")  dynamic previous, @JsonKey(name: "results")  List<PokemonEntryModel> results)?  $default,) {final _that = this;
switch (_that) {
case _PokemonListResponse() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonListResponse implements PokemonListResponse {
  const _PokemonListResponse({@JsonKey(name: "count") required this.count, @JsonKey(name: "next") required this.next, @JsonKey(name: "previous") required this.previous, @JsonKey(name: "results") required final  List<PokemonEntryModel> results}): _results = results;
  factory _PokemonListResponse.fromJson(Map<String, dynamic> json) => _$PokemonListResponseFromJson(json);

@override@JsonKey(name: "count") final  int count;
@override@JsonKey(name: "next") final  String? next;
@override@JsonKey(name: "previous") final  dynamic previous;
 final  List<PokemonEntryModel> _results;
@override@JsonKey(name: "results") List<PokemonEntryModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PokemonListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonListResponseCopyWith<_PokemonListResponse> get copyWith => __$PokemonListResponseCopyWithImpl<_PokemonListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonListResponse&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&const DeepCollectionEquality().equals(other.previous, previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,const DeepCollectionEquality().hash(previous),const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PokemonListResponse(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PokemonListResponseCopyWith<$Res> implements $PokemonListResponseCopyWith<$Res> {
  factory _$PokemonListResponseCopyWith(_PokemonListResponse value, $Res Function(_PokemonListResponse) _then) = __$PokemonListResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "count") int count,@JsonKey(name: "next") String? next,@JsonKey(name: "previous") dynamic previous,@JsonKey(name: "results") List<PokemonEntryModel> results
});




}
/// @nodoc
class __$PokemonListResponseCopyWithImpl<$Res>
    implements _$PokemonListResponseCopyWith<$Res> {
  __$PokemonListResponseCopyWithImpl(this._self, this._then);

  final _PokemonListResponse _self;
  final $Res Function(_PokemonListResponse) _then;

/// Create a copy of PokemonListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PokemonListResponse(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as dynamic,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<PokemonEntryModel>,
  ));
}


}


/// @nodoc
mixin _$PokemonEntryModel {

@JsonKey(name: "name") String get name;@JsonKey(name: "url") String get url;
/// Create a copy of PokemonEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonEntryModelCopyWith<PokemonEntryModel> get copyWith => _$PokemonEntryModelCopyWithImpl<PokemonEntryModel>(this as PokemonEntryModel, _$identity);

  /// Serializes this PokemonEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonEntryModel&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonEntryModel(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $PokemonEntryModelCopyWith<$Res>  {
  factory $PokemonEntryModelCopyWith(PokemonEntryModel value, $Res Function(PokemonEntryModel) _then) = _$PokemonEntryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "name") String name,@JsonKey(name: "url") String url
});




}
/// @nodoc
class _$PokemonEntryModelCopyWithImpl<$Res>
    implements $PokemonEntryModelCopyWith<$Res> {
  _$PokemonEntryModelCopyWithImpl(this._self, this._then);

  final PokemonEntryModel _self;
  final $Res Function(PokemonEntryModel) _then;

/// Create a copy of PokemonEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonEntryModel].
extension PokemonEntryModelPatterns on PokemonEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _PokemonEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "name")  String name, @JsonKey(name: "url")  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonEntryModel() when $default != null:
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "name")  String name, @JsonKey(name: "url")  String url)  $default,) {final _that = this;
switch (_that) {
case _PokemonEntryModel():
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "name")  String name, @JsonKey(name: "url")  String url)?  $default,) {final _that = this;
switch (_that) {
case _PokemonEntryModel() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonEntryModel implements PokemonEntryModel {
  const _PokemonEntryModel({@JsonKey(name: "name") required this.name, @JsonKey(name: "url") required this.url});
  factory _PokemonEntryModel.fromJson(Map<String, dynamic> json) => _$PokemonEntryModelFromJson(json);

@override@JsonKey(name: "name") final  String name;
@override@JsonKey(name: "url") final  String url;

/// Create a copy of PokemonEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonEntryModelCopyWith<_PokemonEntryModel> get copyWith => __$PokemonEntryModelCopyWithImpl<_PokemonEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonEntryModel&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonEntryModel(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$PokemonEntryModelCopyWith<$Res> implements $PokemonEntryModelCopyWith<$Res> {
  factory _$PokemonEntryModelCopyWith(_PokemonEntryModel value, $Res Function(_PokemonEntryModel) _then) = __$PokemonEntryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "name") String name,@JsonKey(name: "url") String url
});




}
/// @nodoc
class __$PokemonEntryModelCopyWithImpl<$Res>
    implements _$PokemonEntryModelCopyWith<$Res> {
  __$PokemonEntryModelCopyWithImpl(this._self, this._then);

  final _PokemonEntryModel _self;
  final $Res Function(_PokemonEntryModel) _then;

/// Create a copy of PokemonEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,}) {
  return _then(_PokemonEntryModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
