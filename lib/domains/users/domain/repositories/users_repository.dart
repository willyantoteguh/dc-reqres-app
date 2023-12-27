import 'package:dartz/dartz.dart';

import '../../../../app/error/failure_response.dart';
import '../entities/request/user_request_entity.dart';
import '../entities/response/create_user_entity.dart';
import '../entities/response/update_user_entity.dart';
import '../entities/response/user_entity.dart';

abstract class UsersRepository {
  const UsersRepository();

  Future<Either<FailureResponse, UserEntity>> getAllUsers({required int page});

  Future<Either<FailureResponse, CreateUserEntity>> createUser({required UserRequestEntity userRequestEntity});

  Future<Either<FailureResponse, UpdateUserEntity>> updateUser({required UserRequestEntity userRequestEntity});

  Future<Either<FailureResponse, int>> deleteUser({required int userId});
}