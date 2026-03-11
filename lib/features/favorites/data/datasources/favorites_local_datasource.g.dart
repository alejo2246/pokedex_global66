// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_local_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(favoritesLocalDataSource)
final favoritesLocalDataSourceProvider = FavoritesLocalDataSourceProvider._();

final class FavoritesLocalDataSourceProvider
    extends
        $FunctionalProvider<
          FavoritesLocalDataSource,
          FavoritesLocalDataSource,
          FavoritesLocalDataSource
        >
    with $Provider<FavoritesLocalDataSource> {
  FavoritesLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<FavoritesLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FavoritesLocalDataSource create(Ref ref) {
    return favoritesLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FavoritesLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FavoritesLocalDataSource>(value),
    );
  }
}

String _$favoritesLocalDataSourceHash() =>
    r'5ff3e7ee674397a0e9aef240b729e6f25cb6041f';
