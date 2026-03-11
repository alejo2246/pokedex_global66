import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_service_interceptor.g.dart';

@riverpod
NetworkServiceInterceptor networkServiceInterceptor(Ref ref) {
  // final secureStorage = ref.watch(secureStorageProvider); // cuando haya auth
  return NetworkServiceInterceptor();
}

final class NetworkServiceInterceptor extends Interceptor {
  // final ISecureStorage _secureStorage; Si esta app usara auth, aca usariamos el secure
  // storage para leer el access token e inyectarlo en las peticiones

  NetworkServiceInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //Aca se obtendria el accessToken si fuera necesario

    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    super.onRequest(options, handler);
  }
}
