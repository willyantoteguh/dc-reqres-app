import 'package:dartz/dartz.dart';

import '../error/failure_response.dart';

abstract class UseCase<T, Params> {
  const UseCase();

  Future<Either<FailureResponse, T>> call(Params params);
}

class NoParams {
  const NoParams();
}
