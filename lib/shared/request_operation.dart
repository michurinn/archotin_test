  
import 'package:archonit_test/shared/failure.dart';
import 'package:archonit_test/shared/result.dart';

typedef RequestOperation<T> = Future<Result<T, Failure>>;
