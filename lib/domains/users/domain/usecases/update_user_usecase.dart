import 'package:dartz/dartz.dart';

import '../../../../app/error/failure_response.dart';
import '../../../../app/usecases/usecase.dart';
import '../entities/request/user_request_entity.dart';
import '../entities/response/update_user_entity.dart';
import '../repositories/users_repository.dart';

class UpdateUserUseCase extends UseCase<UpdateUserEntity, UserRequestEntity> {
  final UsersRepository usersRepository;

  UpdateUserUseCase({required this.usersRepository});

  @override
  Future<Either<FailureResponse, UpdateUserEntity>> call(
          UserRequestEntity params) async =>
      await usersRepository.updateUser(userRequestEntity: params);
}