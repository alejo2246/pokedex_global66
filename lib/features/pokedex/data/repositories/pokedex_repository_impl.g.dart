// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pokedexRepository)
final pokedexRepositoryProvider = PokedexRepositoryProvider._();

final class PokedexRepositoryProvider
    extends
        $FunctionalProvider<
          IPokedexRepository,
          IPokedexRepository,
          IPokedexRepository
        >
    with $Provider<IPokedexRepository> {
  PokedexRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokedexRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokedexRepositoryHash();

  @$internal
  @override
  $ProviderElement<IPokedexRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IPokedexRepository create(Ref ref) {
    return pokedexRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IPokedexRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IPokedexRepository>(value),
    );
  }
}

String _$pokedexRepositoryHash() => r'7d3f5897eee6c088c86d4bbca089e6b0d94fb6fc';
