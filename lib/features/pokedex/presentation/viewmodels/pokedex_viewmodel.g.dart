// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PokedexViewModel)
final pokedexViewModelProvider = PokedexViewModelProvider._();

final class PokedexViewModelProvider
    extends $AsyncNotifierProvider<PokedexViewModel, PokedexState> {
  PokedexViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokedexViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokedexViewModelHash();

  @$internal
  @override
  PokedexViewModel create() => PokedexViewModel();
}

String _$pokedexViewModelHash() => r'5fc63315adcd5f856e5ae0505156d78f5d894836';

abstract class _$PokedexViewModel extends $AsyncNotifier<PokedexState> {
  FutureOr<PokedexState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PokedexState>, PokedexState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PokedexState>, PokedexState>,
              AsyncValue<PokedexState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
