import 'package:dio/dio.dart';

import 'package:pokedex/core/data/remote/network_service_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/api_constants.dart';

part 'network_service.g.dart';

@Riverpod(keepAlive: true)
Dio networkService(Ref ref) {
  final options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Content-Type': 'application/json'},
  );

  final dio = Dio(options);
  dio.interceptors.add(ref.watch(networkServiceInterceptorProvider));

  return dio;
}
