// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoritesViewModel)
final favoritesViewModelProvider = FavoritesViewModelProvider._();

final class FavoritesViewModelProvider
    extends $AsyncNotifierProvider<FavoritesViewModel, FavoritesState> {
  FavoritesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesViewModelHash();

  @$internal
  @override
  FavoritesViewModel create() => FavoritesViewModel();
}

String _$favoritesViewModelHash() =>
    r'86810703c431526d2f9ec91a69fafa3d2a87ccf6';

abstract class _$FavoritesViewModel extends $AsyncNotifier<FavoritesState> {
  FutureOr<FavoritesState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<FavoritesState>, FavoritesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FavoritesState>, FavoritesState>,
              AsyncValue<FavoritesState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
