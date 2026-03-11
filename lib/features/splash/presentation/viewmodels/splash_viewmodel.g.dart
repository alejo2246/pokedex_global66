// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SplashViewModel)
final splashViewModelProvider = SplashViewModelProvider._();

final class SplashViewModelProvider
    extends $AsyncNotifierProvider<SplashViewModel, SplashDestination> {
  SplashViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashViewModelHash();

  @$internal
  @override
  SplashViewModel create() => SplashViewModel();
}

String _$splashViewModelHash() => r'335027d7e5f88962ec0b6c7045414c2a86df29ad';

abstract class _$SplashViewModel extends $AsyncNotifier<SplashDestination> {
  FutureOr<SplashDestination> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SplashDestination>, SplashDestination>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SplashDestination>, SplashDestination>,
              AsyncValue<SplashDestination>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
