import 'package:dio/dio.dart';

import '../../../../../app/constants/app_constants.dart';
import '../../models/request/user_request.dart';
import '../../models/response/create_user_response.dart';
import '../../models/response/update_user_response.dart';
import '../../models/response/users_response.dart';

abstract class UsersRemoteDataSource {
  const UsersRemoteDataSource();

  Future<UserResponse> getAllUsers({required int page});

  Future<CreateUserResponse> createUser({required UserRequest userRequest});

  Future<UpdateUserResponse> updateUser({required UserRequest userRequest});

  Future<int?> deleteUser({required int userId});
}

class UserRemoteDataSourceImpl implements UsersRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserResponse> getAllUsers({required int page}) async {
    try {
      final response = await dio.get("${AppConstants.appApi.allUsers}$page");
      return UserResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CreateUserResponse> createUser({required UserRequest userRequest}) async {
    try {
      final response = await dio.post(AppConstants.appApi.createUser,
          data: userRequest.toJson());
      return CreateUserResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UpdateUserResponse> updateUser(
      {required UserRequest userRequest}) async {
    try {
      final response = await dio.put("${AppConstants.appApi.updateUser}${userRequest.id}",
          data: userRequest.toJson());
      return UpdateUserResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<int?> deleteUser({required int userId}) async {
    try {
      final response = await dio.delete("${AppConstants.appApi.updateUser}$userId}",
      );
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }
}
