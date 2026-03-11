// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_favorite_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(toggleFavoriteUseCase)
final toggleFavoriteUseCaseProvider = ToggleFavoriteUseCaseProvider._();

final class ToggleFavoriteUseCaseProvider
    extends
        $FunctionalProvider<
          ToggleFavoriteUseCase,
          ToggleFavoriteUseCase,
          ToggleFavoriteUseCase
        >
    with $Provider<ToggleFavoriteUseCase> {
  ToggleFavoriteUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toggleFavoriteUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toggleFavoriteUseCaseHash();

  @$internal
  @override
  $ProviderElement<ToggleFavoriteUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ToggleFavoriteUseCase create(Ref ref) {
    return toggleFavoriteUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToggleFavoriteUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToggleFavoriteUseCase>(value),
    );
  }
}

String _$toggleFavoriteUseCaseHash() =>
    r'c922e3870b728afe52a668b7f2a3e0e8fba3c412';
