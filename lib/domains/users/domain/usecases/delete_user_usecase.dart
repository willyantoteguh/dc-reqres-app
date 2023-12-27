import 'package:dartz/dartz.dart';

import '../../../../app/error/failure_response.dart';
import '../../../../app/usecases/usecase.dart';
import '../repositories/users_repository.dart';

class DeleteUserUseCase extends UseCase<int, int> {
  final UsersRepository usersRepository;

  DeleteUserUseCase({required this.usersRepository});

  @override
  Future<Either<FailureResponse, int>> call(int params) async =>
      await usersRepository.deleteUser(userId: params);
}
