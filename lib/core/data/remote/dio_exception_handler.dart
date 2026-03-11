import 'package:dio/dio.dart';

import '../../utils/result.dart';

Failure<T> handleDioException<T>(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError:
      return Failure('No internet connection', type: FailureType.network);
    case DioExceptionType.badResponse:
      return Failure(
        e.response?.data?['message'] ?? 'Server error',
        statusCode: e.response?.statusCode,
        type: FailureType.server,
      );
    default:
      return Failure(e.message ?? 'Unexpected error');
  }
}
