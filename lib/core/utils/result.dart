sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

final class Failure<T> extends Result<T> {
  final String message;
  final int? statusCode;
  final FailureType type;

  const Failure(
    this.message, {
    this.statusCode,
    this.type = FailureType.unexpected,
  });
}

enum FailureType { network, server, file, unexpected }
