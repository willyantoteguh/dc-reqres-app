


import 'package:get/get.dart';

import '../../../../domains/users/domain/repositories/users_repository.dart';
import '../../../../domains/users/domain/usecases/add_user_usecase.dart';
import 'create_user_controlelr.dart';

class CreateUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddUserUseCase(usersRepository: Get.find<UsersRepository>()));
    Get.put(CreateUserController(Get.find()), permanent: true);
  }
}