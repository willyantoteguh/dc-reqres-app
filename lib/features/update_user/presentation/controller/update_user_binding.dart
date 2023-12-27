import 'package:get/get.dart';

import '../../../../domains/users/domain/repositories/users_repository.dart';
import '../../../../domains/users/domain/usecases/update_user_usecase.dart';
import 'update_user_controlelr.dart';

class UpdateUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => UpdateUserUseCase(usersRepository: Get.find<UsersRepository>()));
    Get.put(UpdateUserController(Get.find()), permanent: true);
  }
}
