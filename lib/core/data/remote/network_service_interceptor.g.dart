// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_service_interceptor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(networkServiceInterceptor)
final networkServiceInterceptorProvider = NetworkServiceInterceptorProvider._();

final class NetworkServiceInterceptorProvider
    extends
        $FunctionalProvider<
          NetworkServiceInterceptor,
          NetworkServiceInterceptor,
          NetworkServiceInterceptor
        >
    with $Provider<NetworkServiceInterceptor> {
  NetworkServiceInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkServiceInterceptorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkServiceInterceptorHash();

  @$internal
  @override
  $ProviderElement<NetworkServiceInterceptor> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NetworkServiceInterceptor create(Ref ref) {
    return networkServiceInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkServiceInterceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkServiceInterceptor>(value),
    );
  }
}

String _$networkServiceInterceptorHash() =>
    r'dd491c4a48689a277ac2c215a5e182d2d9014a1e';
