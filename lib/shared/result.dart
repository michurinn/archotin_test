import 'package:archonit_test/shared/failure.dart';

abstract base class Result<T, E extends Failure> {
  abstract final T? data;
  abstract final E? error;

  factory Result.ok(T data) => ResultOk(result: data);

  factory Result.error(E error) => ResultError(err: error);
}

final class ResultOk<T, E extends Failure> implements Result<T, E> {
  final T result;

  @override
  T get data => result;

  @override
  E? get error => null;

  ResultOk({required this.result});
}

final class ResultError<T, E extends Failure> implements Result<T, E> {
  final E err;
  @override
  E get error => err;

  @override
  T? get data => null;
  ResultError({required this.err});
}
