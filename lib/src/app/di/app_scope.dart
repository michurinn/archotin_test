import 'package:archonit_test/src/app/di/disposable_object.dart';
import 'package:dio/dio.dart';

/// {@template app_scope.class}
/// Scoping the dependencies of the entire project
/// {@endtemplate}
class AppScope implements IAppScope {
  @override
  final Dio dio;
  /// {@macro app_scope.class}
  AppScope({required this.dio});

  @override
  void dispose() {}
}

abstract interface class IAppScope implements DisposableObject {
  Dio get dio;
}
