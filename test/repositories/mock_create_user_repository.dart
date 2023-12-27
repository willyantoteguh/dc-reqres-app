
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:digital_center_app/app/error/failure_response.dart';
import 'package:digital_center_app/domains/users/data/models/response/create_user_response.dart';
import 'package:digital_center_app/domains/users/domain/entities/request/user_request_entity.dart';
import 'package:digital_center_app/domains/users/domain/entities/response/create_user_entity.dart';
import 'package:digital_center_app/domains/users/domain/entities/response/update_user_entity.dart';
import 'package:digital_center_app/domains/users/domain/entities/response/user_entity.dart';
import 'package:digital_center_app/domains/users/domain/repositories/users_repository.dart';

class MockCreateUserRepository extends UsersRepository {
  @override
  Future<Either<FailureResponse, CreateUserEntity>> createUser({required UserRequestEntity userRequestEntity}) async {
   throw UnimplementedError();
    
  }

  @override
  Future<Either<FailureResponse, int>> deleteUser({required int userId}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureResponse, UserEntity>> getAllUsers({required int page}) {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureResponse, UpdateUserEntity>> updateUser({required UserRequestEntity userRequestEntity}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

}