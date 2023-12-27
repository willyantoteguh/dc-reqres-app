import 'package:digital_center_app/domains/users/data/models/request/user_request.dart';
import 'package:digital_center_app/domains/users/data/models/response/create_user_response.dart';
import 'package:digital_center_app/domains/users/data/models/response/update_user_response.dart';
import 'package:digital_center_app/domains/users/domain/entities/request/user_request_entity.dart';
import 'package:digital_center_app/domains/users/domain/entities/response/create_user_entity.dart';
import 'package:digital_center_app/domains/users/domain/entities/response/update_user_entity.dart';

import '../models/response/users_response.dart';
import '../../domain/entities/response/user_entity.dart';

class UsersMapper {
  UserEntity mapToUserEntity(UserResponse users) {
    return UserEntity(
        page: users.page ?? 0,
        perPage: users.perPage ?? 0,
        total: users.total ?? 0,
        totalPages: users.totalPages ?? 0,
        data: mapToListUser(users.data));
  }

  User mapToUser(UserDto userDto) {
    return User(
        id: userDto.id ?? 0,
        email: userDto.email ?? "",
        firstName: userDto.firstName ?? "",
        lastName: userDto.lastName ?? "",
        avatar: userDto.avatar ?? "");
  }

  List<User> mapToListUser(List<UserDto>? list) {
    final listUsers = <User>[];

    for (UserDto userDto in list!) {
      listUsers.add(mapToUser(userDto));
    }

    return listUsers;
  }

  CreateUserEntity mapToCreateUserEntity(CreateUserResponse createUserDto) {
    return CreateUserEntity(
        name: createUserDto.name ?? "",
        job: createUserDto.job ?? "",
        id: createUserDto.id ?? "",
        createdAt: createUserDto.createdAt ?? "");
  }

  UpdateUserEntity mapToUpdateUserEntity(UpdateUserResponse updateUserDto) {
    return UpdateUserEntity(updateUserDto.name ?? "", updateUserDto.job ?? "",
        updateUserDto.updatedAt ?? "");
  }

  UserRequest mapToUserRequest(UserRequestEntity userRequestEntity) {
    return UserRequest(
        id: userRequestEntity.id,
        name: userRequestEntity.name,
        job: userRequestEntity.job);
  }
}
