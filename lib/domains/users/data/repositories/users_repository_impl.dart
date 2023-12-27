import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../app/constants/app_constants.dart';
import '../../../../app/error/failure_response.dart';
import '../../domain/entities/request/user_request_entity.dart';
import '../../domain/entities/response/create_user_entity.dart';
import '../../domain/entities/response/update_user_entity.dart';
import '../../domain/entities/response/user_entity.dart';
import '../../domain/repositories/users_repository.dart';
import '../datasource/remote/users_remote_datasource.dart';
import '../mapper/users_mapper.dart';

class UserRepositoryImpl implements UsersRepository {
  final UsersRemoteDataSource usersRemoteDataSource;
  final UsersMapper usersMapper;

  UserRepositoryImpl(
      {required this.usersRemoteDataSource, required this.usersMapper});

  @override
  Future<Either<FailureResponse, UserEntity>> getAllUsers(
      {required int page}) async {
    try {
      final response = await usersRemoteDataSource.getAllUsers(page: page);

      return Right(usersMapper.mapToUserEntity(response));
    } on DioException catch (e) {
      return Left(FailureResponse(
          errorMessage: e.response?.data[AppConstants.errorKey]?.toString() ??
              e.response.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, CreateUserEntity>> createUser(
      {required UserRequestEntity userRequestEntity}) async {
    try {
      final response = await usersRemoteDataSource.createUser(
          userRequest: usersMapper.mapToUserRequest(userRequestEntity));

      return Right(usersMapper.mapToCreateUserEntity(response));
    } on DioException catch (e) {
      return Left(FailureResponse(
          errorMessage: e.response?.data[AppConstants.errorKey]?.toString() ??
              e.response.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, int>> deleteUser(
      {required int userId}) async {
    try {
      final response = await usersRemoteDataSource.deleteUser(userId: userId) ?? 0;

      return Right(response);
    } on DioException catch (e) {
      return Left(FailureResponse(
          errorMessage: e.response?.data[AppConstants.errorKey]?.toString() ??
              e.response.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, UpdateUserEntity>> updateUser(
      {required UserRequestEntity userRequestEntity}) async {
    try {
      final response = await usersRemoteDataSource.updateUser(
          userRequest: usersMapper.mapToUserRequest(userRequestEntity));

      return Right(usersMapper.mapToUpdateUserEntity(response));
    } on DioException catch (e) {
      return Left(FailureResponse(
          errorMessage: e.response?.data[AppConstants.errorKey]?.toString() ??
              e.response.toString()));
    }
  }
}
