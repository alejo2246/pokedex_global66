// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PokemonDetailViewModel)
final pokemonDetailViewModelProvider = PokemonDetailViewModelFamily._();

final class PokemonDetailViewModelProvider
    extends $AsyncNotifierProvider<PokemonDetailViewModel, PokemonDetail> {
  PokemonDetailViewModelProvider._({
    required PokemonDetailViewModelFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'pokemonDetailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pokemonDetailViewModelHash();

  @override
  String toString() {
    return r'pokemonDetailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PokemonDetailViewModel create() => PokemonDetailViewModel();

  @override
  bool operator ==(Object other) {
    return other is PokemonDetailViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pokemonDetailViewModelHash() =>
    r'f51874044050ca779bcec4fa947e8f8b37ba4304';

final class PokemonDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          PokemonDetailViewModel,
          AsyncValue<PokemonDetail>,
          PokemonDetail,
          FutureOr<PokemonDetail>,
          int
        > {
  PokemonDetailViewModelFamily._()
    : super(
        retry: null,
        name: r'pokemonDetailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PokemonDetailViewModelProvider call(int id) =>
      PokemonDetailViewModelProvider._(argument: id, from: this);

  @override
  String toString() => r'pokemonDetailViewModelProvider';
}

abstract class _$PokemonDetailViewModel extends $AsyncNotifier<PokemonDetail> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<PokemonDetail> build(int id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PokemonDetail>, PokemonDetail>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PokemonDetail>, PokemonDetail>,
              AsyncValue<PokemonDetail>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
