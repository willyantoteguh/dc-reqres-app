import 'package:dartz/dartz.dart';

import '../../../../app/error/failure_response.dart';
import '../../../../app/usecases/usecase.dart';
import '../entities/response/user_entity.dart';
import '../repositories/users_repository.dart';

class GetAllUsersUseCase extends UseCase<UserEntity, int> {
  final UsersRepository usersRepository;

  GetAllUsersUseCase({required this.usersRepository});

  @override
  Future<Either<FailureResponse, UserEntity>> call(int params) async => await usersRepository.getAllUsers(page: params);
}