import 'package:dartz/dartz.dart';

import '../../../../app/error/failure_response.dart';
import '../../../../app/usecases/usecase.dart';
import '../entities/request/user_request_entity.dart';
import '../entities/response/create_user_entity.dart';
import '../repositories/users_repository.dart';

class AddUserUseCase extends UseCase<CreateUserEntity, UserRequestEntity> {
  final UsersRepository usersRepository;

  AddUserUseCase({required this.usersRepository});

  @override
  Future<Either<FailureResponse, CreateUserEntity>> call(
          UserRequestEntity params) async =>
      await usersRepository.createUser(userRequestEntity: params);
}
